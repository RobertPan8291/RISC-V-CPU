module comb_block_left(mem_cmd, mem_addr, enable2); // enables only if CPU is trying to read smth from memory
                                              // and address it is trying to read from is 0x140
  input [1:0] mem_cmd;
  input [8:0] mem_addr; 
  output reg enable2; 

  always @(*) begin
    if(mem_cmd == 2'b00 & mem_addr == 9'h140) begin
      enable2 = 1'b1;
    end else begin
      enable2 = 1'b0;
    end
  end
endmodule

module comb_block_right(mem_cmd, mem_addr, out, present_state); // enables only if CPU is trying to read smth from memory
                                              // and address it is trying to read from is 0x140
  input [1:0] mem_cmd;
  input [8:0] mem_addr; 
  input [4:0] present_state;
  output reg out; 

  always @(*) begin
    if(mem_cmd == 2'b10 & mem_addr == 9'h100 & present_state == 5'b10100) begin
      out = 1'b1;
    end else begin
      out = 1'b0;
    end
  end
endmodule

module regtest(in, load, clk, out); // lets write_data go thru to LEDs
	input [7:0] in; 
	input load, clk;
	output reg [7:0] out; 
	
	always_ff @(posedge clk) begin
		if(load == 1'b1) begin
			out <= in; 
		end else begin
      out <= 8'b00000000;
    end
	end 
endmodule


module lab7_top(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
  input [3:0] KEY;
  input [9:0] SW;
  output [9:0] LEDR;
  output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	wire clk, reset, s, load;
	reg [15:0] read_data;
	wire [15:0] write_data;
	wire N, V, Z, w, write, enable, enable2, loadLED;
	wire [8:0] mem_addr;
	wire [1:0] mem_cmd;
  wire [15:0] dout;
	reg [15:0] din;
  wire [4:0] present_state_out;


  cpu CPU((~KEY[0]), (~KEY[1]), (~KEY[2]), (~KEY[3]), read_data, write_data, N, V, Z, w, mem_cmd, mem_addr, read_data, present_state_out);
	 
	always@(*) begin
	  din = write_data;
	end	

  RAM MEM(~KEY[0], mem_addr[7:0], mem_addr[7:0], write, din, dout); //"out" here indicates din

  tri_state_controller controller(mem_cmd, mem_addr[8], enable, write);

  comb_block_left controller2(mem_cmd, mem_addr, enable2);

  comb_block_right controller3(mem_cmd, mem_addr, loadLED, present_state_out);

  regtest bakakakaka(write_data [7:0], loadLED, ~KEY[0], LEDR[7:0]);
  
  assign LEDR[9:8] = 2'b0;
    
  always@(*) begin // prevents read_data from being "assigned twice"
    if(mem_addr == 9'h140) begin
      read_data[7:0] = enable2 ? SW[7:0] : {16{1'bz}};
      read_data[15:8] = enable2 ? 8'h00 : {16{1'bz}};
    end
    else begin
      read_data = enable ? dout : {16{1'bz}};
    end
  end


endmodule 