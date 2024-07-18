//`include "regfile.sv"
//`include "ALU.sv"
//`include "shifter.sv"

module pipeline_reg(indata, load, clk, out); // 3, 4, 5
	input reg [15:0] indata; 
	input load; 
	input clk; 
	output reg [15:0] out;
	
	reg [15:0] chosen;
	
	always @(*) begin // mux that determines if we want to use the loaded value or not
		case(load)
			1'b0: chosen = out; // if load is 0 then previous out stays as output
			1'b1: chosen = indata; // if load is 1 then data from reg goes thru
			default: chosen = 16'bxxxxxxxxxxxxxxxx;
		endcase
	end
	
	always_ff@(posedge clk) begin
		out <= chosen; 
	end
endmodule 

module sourceop_mux_a(indata, sel, out); // 6
	input [15:0] indata;
	input sel;
	output reg[15:0] out;
	
	always @(*) begin
		case(sel)
			1'b0: out = indata;  // if asel is 0 then the data from the register goes through
			1'b1: out = 16'b0000000000000000;  // if asel is 1 then 0s goes through
			default: out = 16'bxxxxxxxxxxxxxxxx;
		endcase
	end 
endmodule

module sourceop_mux_b(indata, sel, sximm5, out); // 7
	input [15:0] indata, sximm5;
	input sel;
	output reg[15:0] out;
	
	always @(*) begin
		case(sel)
			1'b0: out = indata;  // if bsel is 0 then the data from the register goes through
			1'b1: out = sximm5; // if bsel is 1 then 0s and parts of data path goes through
			default: out = 16'bxxxxxxxxxxxxxxxx;
		endcase
	end 
endmodule

module shift_mux(shiftin, sel, out);
	input [1:0] shiftin;
	input sel;
	
	output reg [1:0] out; 
	
	always @(*) begin
		case(sel)
			1'b0: out = shiftin;
			1'b1: out = 2'b00; 
			default: out = 2'bxx; 
		endcase
	end
endmodule


module writeback_mux(mdata, sximm8, PC, C, vsel, out); // 9
	input [15:0] mdata, sximm8, C;
	input [7:0] PC;
	input [1:0] vsel;
	output reg [15:0] out;

	always @(*) begin
		case(vsel)
			2'b00: out = C; // if vsel is 0 then the old data goes through
			2'b01: out = sximm8; // if vsel is 1 then the new data goes through
			2'b10: out = {8'b0,PC};
			2'b11: out = mdata;
			default: out = 16'bxxxxxxxxxxxxxxxx;
		endcase
	end 
endmodule


module status_reg(zin, load, clk, out); // 10
	input reg zin;
	input load; 
	input clk;
	output reg out; 

	reg chosen;

	always @(*) begin
		case(load)
			1'b0: chosen = out; // if loads is 0 then old data goes thru
			1'b1: chosen = zin; // if loads is 1 then new datat (otuput from ALU) goes thru
		endcase
	end
	
	always_ff@(posedge clk) begin
		out <= chosen; 
	end
endmodule

module datapath(clk, readnum, vsel, loada, loadb, shift, asel, bsel, ALUop, loadc, loads, writenum, write, sximm8, Z_out, V, N, C, mdata, PC, sximm5, shiftsel); 
	input clk;

	// fetch
	input [2:0] readnum;
	input [1:0] vsel;
	input shiftsel;
	input loada;
	input loadb;
	
	// computation
	input [1:0] shift;
	input asel;
	input bsel;
	input [1:0] ALUop;
	input loadc;
	input loads;

	input [2:0] writenum;
	input write;
	input [15:0] sximm8, sximm5;
	input [15:0] mdata;
	input [7:0] PC;
	
	//outputs
	output Z_out, V, N;
	output [15:0] C;

	wire [15:0] data_in;
	wire [15:0] data_out;
	wire [15:0] amongusA_out;
	wire [15:0] shifter_in;
	wire [15:0] shifter_out;
	wire [15:0] Ain;
	wire [15:0] Bin;
	wire [15:0] ALU_out;
	wire Z_signal;
	wire [1:0] shift_out;

	writeback_mux mux1(mdata, sximm8, PC, C, vsel, data_in); // instantiates (9) start of process

	regfile REGFILE(data_in,writenum,write,readnum,clk,data_out); // instantiates (1) regfile
	
	pipeline_reg amongusA(data_out, loada, clk, amongusA_out); // instantiates (3) loading first value
	pipeline_reg amongusB(data_out, loadb, clk, shifter_in); // instantiates (4) loading second value
	
	sourceop_mux_a sussySelectA(amongusA_out, asel, Ain); // instantiates (6)
	
	shift_mux kissinger_is_dead(shift, shiftsel, shift_out);

	shifter baka(shifter_in, shift_out, shifter_out); // instantiates (8)
	
	sourceop_mux_b sussySelectB(shifter_out, bsel, sximm5, Bin); // instantiates (7) 

	ALU KYS(Ain, Bin, ALUop, ALU_out, Z_signal, V, N); // instantiates (2)

	status_reg cumin(Z_signal, loads, clk, Z_out); // instantiates (10)
	
	pipeline_reg amongusC(ALU_out, loadc, clk, C); // instantiates (5)

endmodule
	