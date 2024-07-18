module decoder3to8(in, out);  //Standard 3 to 8 bit decoder
	input reg [2:0] in;  
	output reg [7:0] out;

	always @(in) begin 
		case(in)  // determines the one-hot output depending on the binary input
		 	3'b000: out = 8'b00000001;
         	3'b001: out = 8'b00000010;
         	3'b010: out = 8'b00000100;
         	3'b011: out = 8'b00001000;
         	3'b100: out = 8'b00010000;
        	3'b101: out = 8'b00100000;
        	3'b110: out = 8'b01000000;
         	3'b111: out = 8'b10000000;
			default: out = 8'bxxxxxxxx;
		endcase
	end
endmodule

module register(indata,load,clk,out); // creates registers
	input reg [15:0] indata; 
	input load; 
	input clk; 
	output reg [15:0] out;
	
	reg [15:0] chosen; // local variable meant to store the data that is coming out of the mux
	
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

module mux8to1(num, R0, R1, R2, R3, R4, R5, R6, R7, out); 
	input [7:0] num; 
	input [15:0] R0, R1, R2, R3, R4, R5, R6, R7; //The individual register's output that goes into the mux
	output reg [15:0] out; 
	
	always @(*) begin
		case(num) //Select a register based on one-hot code 
			8'b00000001: out = R0;
			8'b00000010: out = R1;
			8'b00000100: out = R2;
			8'b00001000: out = R3;
			8'b00010000: out = R4;
			8'b00100000: out = R5;
			8'b01000000: out = R6;
			8'b10000000: out = R7;
			default: out = 16'bxxxxxxxxxxxxxxxx;
		endcase
	end
endmodule


module regfile(data_in,writenum,write,readnum,clk,data_out);
	input [15:0] data_in;
	input [2:0] writenum, readnum;
	input write, clk;
	output [15:0] data_out;
	
	reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
	
	wire [7:0] writenum_decoded;
	wire [7:0] readnum_decoded;
	wire [7:0] load;
	
	decoder3to8 WriteDecoder(writenum, writenum_decoded); // instantiating two decoders, one for writing...
	decoder3to8 ReadDecoder(readnum,readnum_decoded); // ... and one for reading

	assign load[0] = write & writenum_decoded[0]; // all of these are anding output from decoder with write
	assign load[1] = write & writenum_decoded[1];
	assign load[2] = write & writenum_decoded[2];
	assign load[3] = write & writenum_decoded[3];
	assign load[4] = write & writenum_decoded[4];
	assign load[5] = write & writenum_decoded[5];
	assign load[6] = write & writenum_decoded[6];
	assign load[7] = write & writenum_decoded[7];


	register r0(data_in, load[0], clk, R0); // creates registers
	register r1(data_in, load[1], clk, R1);
	register r2(data_in, load[2], clk, R2);
	register r3(data_in, load[3], clk, R3);
	register r4(data_in, load[4], clk, R4);
	register r5(data_in, load[5], clk, R5);
	register r6(data_in, load[6], clk, R6);
	register r7(data_in, load[7], clk, R7);

	mux8to1 mux1(readnum_decoded, R0, R1, R2, R3, R4, R5, R6, R7, data_out); // chooses which register to get info from based on input
endmodule
