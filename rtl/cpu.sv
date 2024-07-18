module instru_reg(in, load, clk, out); //lets input go thru to fsm
	input [15:0] in; 
	input load, clk;
	output reg [15:0] out; 
	
	always_ff @(posedge clk) begin
		if(load == 1'b1) begin
			out <= in; 
		end
	end 
endmodule

module pc_reg(in, load, clk, out); //lets input go thru to fsm
	input [8:0] in; 
	input load, clk;
	output reg [8:0] out; 
	
	always_ff @(posedge clk) begin
		if(load == 1'b1) begin
			out <= in; 
		end
	end 
endmodule

module pc_reg_two_clk(indata,load,clk,out); // creates pc reg
	input [8:0] indata; 
	input load; 
	input clk; 
	output reg [8:0] out;
	
	reg [8:0] chosen; // local variable meant to store the data that is coming out of the mux
	
	always @(*) begin
		case(load) // the case represent the Mux that choses whether the new input will be put in 
			1'b0: chosen = out;
			1'b1: chosen = indata;
		endcase
	end
	
	always_ff@(posedge clk) begin
		out <= chosen; 
	end
endmodule 

module mux3to1(Rn, Rd, Rm, nsel, out); // selects register we are working with
	input [2:0] Rn, Rd, Rm; 
	input [1:0] nsel; 
	output reg[2:0] out; 
	
	always @(*) begin 
		case(nsel)
			2'b01: out <= Rm; 
			2'b10: out <= Rd;
			2'b11: out <= Rn; 
			2'b00: out <= 3'bxxx;
			default: out <= 3'bxxx;
		endcase 
	end
endmodule 

module mux2to1pc(in0, sel, out); // decides if we want to reset pc
	input [8:0] in0; 
	input sel; 
	output reg[8:0] out; 
	
	always @(*) begin 
		case(sel)
			1'b0: out <= in0; 
			1'b1: out <= 9'b000000000;
			default: out <= 9'bxxxxxxxxx;
		endcase 
	end
endmodule 


module mux2to1addr(in0, in1, sel, out); // (5) loading instruction [0] or loading 
	input [8:0] in0, in1; 
	input sel; 
	output reg[8:0] out; 
	
	always @(*) begin 
		case(sel)
			1'b0: out <= in0; 
			1'b1: out <= in1;
			default: out <= 9'bxxxxxxxxx;
		endcase 
	end
endmodule 

module signextend8bit(in, out);
	input [7:0] in;
	output [15:0] out; 
	
	assign out[15:0] = { {8{in[7]}}, in[7:0] }; // takes bit 7 and extends it from 8 to 15
endmodule

module signextend5bit(in, out);
	input [4:0] in;
	output [15:0] out; 
	
	assign out[15:0] = { {11{in[4]}}, in[4:0] }; // takes bit 4 and extends it from 5 to 15
endmodule
	
module instru_decoder(in, nsel, opcode, op, writenum, readnum, shift, sximm8, sximm5, ALUop); 
	input [15:0] in; 
	input [1:0] nsel; 

	output [2:0] opcode, readnum, writenum; 
	output [1:0] ALUop, op, shift; 
	output [15:0] sximm5, sximm8; // 5 used for lab7, 8 used lab6
	
	wire [7:0] imm8;
	wire [4:0] imm5;
	wire [2:0] Rn, Rd, Rm;
	wire [2:0] muxout; 
	
	assign opcode = in [15:13]; 
	assign op = in [12:11];
	assign ALUop = in [12:11]; 
	assign shift = in [4:3];
	assign Rn = in [10:8]; 
	assign Rd = in [7:5];
	assign Rm = in [2:0];

	// imm intermediate wires, pre sign-extension
	assign imm8 = in [7:0];
	assign imm5 = in [4:0]; 
	
	signextend8bit lehi(imm8, sximm8); 
	signextend5bit hamas(imm5, sximm5); 
	
	mux3to1 muxsus(Rn, Rd, Rm, nsel, muxout); // selects which register we are working with
	
	assign readnum = muxout;
	assign writenum = muxout; 
	
endmodule

module adder(in, out); // adds 1 to input
	input [8:0] in;
	output [8:0] out; 
	
	assign out = in + 1;
endmodule 	
	

module cpu(clk, reset, s, load, in, out, N, V, Z, w, mem_cmd, mem_addr, mdata, present_state_out); // puts tgt all modules
	input clk, reset, s, load;
	input [15:0] in, mdata;
	output [15:0] out;
	output N, V, Z, w;
	output [8:0] mem_addr;
	output [1:0] mem_cmd;
	output [4:0] present_state_out;
	
	// decoder input
	wire [15:0] decoder_in; 
	wire [1:0] nsel;
	
	//decoder output
	wire [2:0] opcode, readnum, writenum; 
	wire [1:0] ALUop, op, shift, vsel; 
	wire [15:0] sximm5, sximm8; 
	
	// sm output 
	wire loada, loadb, loadc, asel, bsel, write, loads, load_pc, reset_pc, addr_sel, load_ir, load_addr, shiftsel; 
	
	// datapath input
	wire [7:0] PC_sus;
	wire [8:0] PC, adder_out, next_pc, LDR_out; 
	
	instru_reg carrot(in, load_ir, clk, decoder_in);
	
	instru_decoder cucumber(decoder_in, nsel, opcode, op, writenum, readnum, shift, sximm8, sximm5, ALUop);
	
	fsm fsm_controller(s, reset, clk, opcode, op, nsel, vsel, asel, bsel, write, loada, loadb, loadc, loads, w, load_pc, reset_pc, addr_sel, mem_cmd, load_ir, load_addr, shiftsel, present_state_out); 
	
	adder adder1(PC, adder_out);

	mux2to1pc mux1(adder_out, reset_pc, next_pc);

	pc_reg_two_clk reg_pc(next_pc, load_pc, clk, PC);

	pc_reg_two_clk data_address_reg(out[8:0], load_addr, clk, LDR_out);

	mux2to1addr mux2(LDR_out, PC, addr_sel, mem_addr);
	
	datapath DP(clk, readnum, vsel, loada, loadb, shift, asel, bsel, ALUop, loadc, loads, writenum, write, sximm8, Z, V, N, out, mdata, PC_sus, sximm5, shiftsel);
	
endmodule 