`define Srst 5'b00000
`define Sifone 5'b00001
`define Siftwo 5'b00010
`define SUpdatePC 5'b00011
`define Sdecode 5'b00100
`define SMovRn 5'b00101
`define SMovRd 5'b00110
`define Sloada 5'b00111
`define Sloadb 5'b01000 
`define Sloadc 5'b01001
`define Swrite 5'b01010
`define Smem 5'b01011
`define Smemloadc 5'b01100
`define SLDR 5'b01101
`define SLDRtwo 5'b10001
`define SLDRthree 5'b10010
`define SSTR 5'b01110
`define SSTRtwo 5'b01111
`define SSTRthree 5'b10011
`define SSTRfour 5'b10100
`define SHALT 5'b10000
`define MREAD 2'b00
`define MNONE 2'b01
`define MWRITE 2'b10

module fsm(s, reset, clk, opcode, op, nsel, vsel, asel, bsel, write, loada, loadb, loadc, loads, w, load_pc, reset_pc, addr_sel, mem_cmd, load_ir, load_addr, shiftsel, present_state_out);
	input s, reset, clk; 
	input [2:0] opcode; 
	input [1:0] op;
	
	output [1:0] nsel; 
	output [1:0] mem_cmd; 
	output [1:0] vsel; 
	output shiftsel;
	output loada; 
	output loadb; 
	output loadc;
	output asel; 
	output bsel; 
	output write; 
	output loads; 
	output load_pc; 
	output reset_pc; 
	output addr_sel; 
	output load_ir; 
	output load_addr;
	output w;
	output [4:0] present_state_out;
	
	
	// temp regs to modify
	 reg [1:0] nsel_temp = 2'b00;
	 reg [1:0] mem_cmd_temp = 2'b00; 
	 reg [1:0] vsel_temp = 2'b00; 
	 reg loada_temp = 1'b0; 
	 reg loadb_temp = 1'b0; 
	 reg loadc_temp = 1'b0;
	 reg asel_temp= 1'b0; 
	 reg bsel_temp = 1'b0; 
	 reg write_temp  = 1'b0; 
	 reg loads_temp  = 1'b0; 
	 reg load_pc_temp = 1'b0; 
	 reg reset_pc_temp  = 1'b0; 
	 reg addr_sel_temp  = 1'b0; 
	 reg load_ir_temp = 1'b0; 
	 reg load_addr_temp  = 1'b0;
	 reg w_temp  = 1'b0;
	 reg shiftsel_temp = 1'b0;
	
	
	reg [4:0] present_state; 
	reg control = 1'b1; 
	
	always @(posedge clk) begin 
		if(reset) begin 
			present_state = `Srst;
		end else begin 
			case (present_state) 
				`Srst: 
					present_state <= `Sifone;
				`Sifone: 
					present_state <= `Siftwo;
				`Siftwo: 
					present_state <= `SUpdatePC;
				`SUpdatePC:
					present_state <= `Sdecode;
				`Sdecode: // goes to diff states depending on type of instruction
					if(opcode == 3'b110 & op == 2'b10)	
						present_state <= `SMovRn; 
					else if(opcode == 3'b110 & op == 2'b00) 
						present_state <= `SMovRd; 
					else if(opcode == 3'b101) 
						present_state <= `Sloada; 
					else if(opcode == 3'b011 | opcode == 3'b100)
						present_state <= `Smem;
					else if(opcode == 3'b111)
						present_state <= `SHALT;
				`Smem: 
					present_state <= `Smemloadc;
				`Smemloadc:
					if(opcode == 3'b100) 
						present_state <= `SSTR;
					else if (opcode == 3'b011)
						present_state <= `SLDR;
				`SLDR: // need multiple LDRs to make sure we have enough clock cycles to execute instruction
					present_state <= `SLDRtwo;
				`SLDRtwo:
					present_state <= `SLDRthree;
				`SLDRthree:
					present_state <= `Sifone;
				`SSTR: // need multiple STRs to make sure we have enough clock cycles to execute instruction
					present_state <= `SSTRtwo; 
				`SSTRtwo: 
					present_state <= `SSTRthree; 
				`SSTRthree:
					present_state <= `SSTRfour;
				`SSTRfour:
					present_state <= `Sifone; 
				`SMovRn: // mov instruction, constant into reg
					present_state <= `Sifone;
				`SMovRd: // mov instruction, reg into reg
					present_state <= `Sloadc;
				`Sloada: // alu instructions
					present_state <= `Sloadb;
				`Sloadb: // alu instructions
					present_state <= `Sloadc;
				`Sloadc: begin // output
					if(op == 2'b01)
					present_state <= `Sifone; // in cmp stage, we don't write
					else
					present_state <= `Swrite;
					end
				`Swrite: // after writing, we go back to wait
					present_state <= `Sifone; 
				`SHALT:
					present_state <= `SHALT;
				default: present_state <= 5'bxxxxx;
			endcase 
		end		
	end

	 
	/*
					mem_cmd_temp= mem_cmd;
					nsel_temp  = nsel_temp ;
					vsel_temp = vsel_temp;
					loada_temp = loada_temp;
					loadb_temp = loadb_temp;
					loadc_temp = loadc_temp;
					asel_temp = asel_temp;
					bsel_temp = bsel_temp;
					write_temp=write_temp;
					loads_temp = loads_temp;
					load_pc_temp = load_pc_temp;
					reset_pc_temp = reset_pc_temp;
					addr_sel_temp = addr_sel_temp;
					load_ir_temp = load_ir_temp;
					load_addr_temp = load_addr_temp;
					w_temp= w_temp;
	*/
	
	always_comb begin

		// assign original values into temp. temp will change and be reassigned back into og at end of comb block
					mem_cmd_temp= mem_cmd;
					nsel_temp  = nsel;
					vsel_temp = vsel;
					loada_temp = loada;
					loadb_temp = loadb;
					loadc_temp = loadc;
					asel_temp = asel;
					bsel_temp = bsel;
					write_temp=write;
					loads_temp = loads;
					load_pc_temp = load_pc;
					reset_pc_temp = reset_pc;
					addr_sel_temp = addr_sel;
					load_ir_temp = load_ir;
					load_addr_temp = load_addr;
					w_temp= w;
					shiftsel_temp = shiftsel;
					
				/*
				if(control) begin
					mem_cmd_temp= 2'b00;
					nsel_temp  = 2'b00;
					vsel_temp = 2'b00;
					loada_temp = 1'b0;
					loadb_temp = 1'b0;
					loadc_temp = 1'b0;
					asel_temp = 1'b0;
					bsel_temp = 1'b0;
					write_temp= 1'b0;
					loads_temp = 1'b0;
					load_pc_temp = 1'b0;
					reset_pc_temp = 1'b0;
					addr_sel_temp = 1'b0;
					load_ir_temp = 1'b0;
					load_addr_temp = 1'b0;
					w_temp= 1'b0;
					control = 1'b0;
				end else begin
					mem_cmd_temp= mem_cmd;
						nsel_temp  = nsel_temp ;
						vsel_temp = vsel_temp;
						loada_temp = loada_temp;
						loadb_temp = loadb_temp;
						loadc_temp = loadc_temp;
						asel_temp = asel_temp;
						bsel_temp = bsel_temp;
						write_temp=write_temp;
						loads_temp = loads_temp;
						load_pc_temp = load_pc_temp;
						reset_pc_temp = reset_pc_temp;
						addr_sel_temp = addr_sel_temp;
						load_ir_temp = load_ir_temp;
						load_addr_temp = load_addr_temp;
						w_temp= w_temp;
				end
				*/
		case (present_state) 
				`Srst:	begin // nothing happens in this stage. reset brings us here
					reset_pc_temp = 1'b1;
					load_pc_temp = 1'b1;
					load_ir_temp = 1'b0;
					mem_cmd_temp = `MNONE;
					shiftsel_temp = 1'b0;
					
					end
				`Sifone: begin
					w_temp= 1'b1; 
					loads_temp = 1'b0;
					write_temp= 1'b0;
					addr_sel_temp = 1'b1;
					mem_cmd_temp= `MREAD;
					load_pc_temp = 1'b0;
					reset_pc_temp = 1'b0;
					load_ir_temp = 1'b0;
					load_addr_temp = 1'b0;
					shiftsel_temp = 1'b0;
				end
				`Siftwo: begin
						load_ir_temp = 1'b1;
						mem_cmd_temp= `MREAD;
					end
				`SUpdatePC: // 
					begin
						load_ir_temp = 1'b0;
						addr_sel_temp = 1'b0;
						load_pc_temp = 1'b1;
					end
				`Sdecode: // gets ready to take any operations
					begin
					w_temp= 1'b0;
					bsel_temp = 1'b0;
					asel_temp = 1'b0;
					load_pc_temp = 1'b0;
					end
				`Smem: 
					begin 
						loada_temp = 1'b1;
						loadb_temp = 1'b0;
						nsel_temp  = 2'b11; 
						bsel_temp = 1'b1;
						shiftsel_temp = 1'b1;
					end
				`Smemloadc: 
					begin
						loada_temp = 1'b0;
						loadc_temp = 1'b1; 
						load_addr_temp = 1'b1; 
					end
				`SLDR: 
					begin
						addr_sel_temp = 1'b0; 
						mem_cmd_temp= `MREAD; 
					end
				`SLDRtwo:
					begin
						loadc_temp = 1'b0;  
					end
				`SLDRthree:
					begin
						vsel_temp = 2'b11;
						write_temp= 1'b1;
						nsel_temp  = 2'b10;
					end
				`SSTR:
					begin
						loadc_temp = 1'b0;
						loada_temp = 1'b0;
						asel_temp = 1'b1;
						nsel_temp  = 2'b10;
						bsel_temp = 1'b0;
					end
				`SSTRtwo:
					begin
						addr_sel_temp = 1'b0;
						mem_cmd_temp= `MWRITE; 
						load_addr_temp = 1'b0;
						loadc_temp = 1'b1;
						loadb_temp = 1'b1;
					end
				`SSTRthree:
					begin
						loadb_temp = 1'b0;
						load_addr_temp = 1'b0; 
					end
				`SSTRfour:
					begin
						loadc_temp = 1'b0;
					end
				`SMovRn: // only for putting imm value into reg
					begin
						vsel_temp = 2'b01;
						write_temp= 1'b1;
						nsel_temp  = 2'b11; //
					end
				`SMovRd: // only for putting reg value into reg
					begin
						loadb_temp = 1'b1;
						loada_temp = 1'b0;
						asel_temp = 1'b1;
						write_temp= 1'b0;
						nsel_temp  = 2'b01; //
					end
				`Sloada: // ALU instruction step 1
					begin 
						loada_temp = 1'b1;
						loadb_temp = 1'b0;
						nsel_temp  = 2'b11; // load a, Rn
					end 
				`Sloadb: // ALU instruction step 2
					begin
						loada_temp = 1'b0;
						loadb_temp = 1'b1;
						nsel_temp  = 2'b01; // load b, Rm
					end 
				`Sloadc: // ALU instruction result
					begin 	
						loada_temp = 1'b0; 
						loadb_temp = 1'b0;
						loadc_temp = 1'b1;
						loads_temp = 1'b1;
					end
				`Swrite: 
					begin
						vsel_temp = 2'b00; 
						write_temp= 1'b1; 
						nsel_temp  = 2'b10; // Rd (want an out)
						loadc_temp = 1'b0;
					end
				default: 
					begin
					mem_cmd_temp= 2'bxx;
					nsel_temp  = 2'bxx;
					vsel_temp = 2'bxx;
					loada_temp = 1'bx;
					loadb_temp = 1'bx;
					loadc_temp = 1'bx;
					asel_temp = 1'bx;
					bsel_temp = 1'bx;
					write_temp= 1'bx;
					loads_temp = 1'bx;
					load_pc_temp = 1'bx;
					reset_pc_temp = 1'bx;
					addr_sel_temp = 1'bx;
					load_ir_temp = 1'bx;
					load_addr_temp = 1'bx;
					w_temp= 1'bx;
					shiftsel_temp = 1'bx;
					end
			endcase
	end
	
	// reassign temp back into original
	assign nsel = nsel_temp; 
	assign mem_cmd = mem_cmd_temp; 
	assign vsel = vsel_temp ; 
	assign loada = loada_temp; 
	assign loadb = loadb_temp; 
	assign loadc = loadc_temp;
	assign asel = asel_temp; 
	assign bsel = bsel_temp; 
	assign write = write_temp; 
	assign loads = loads_temp; 
	assign load_pc = load_pc_temp; 
	assign reset_pc = reset_pc_temp; 
	assign addr_sel = addr_sel_temp; 
	assign load_ir = load_ir_temp; 
	assign load_addr = load_addr_temp;
	assign w = w_temp;  
	assign shiftsel = shiftsel_temp;
	assign present_state_out = present_state; 
	
endmodule
