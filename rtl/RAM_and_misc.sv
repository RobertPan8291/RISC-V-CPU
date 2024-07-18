module RAM(clk,read_address,write_address,write,din,dout); // from ss11
  parameter data_width = 16; 
  parameter addr_width = 8;
  parameter filename = "data.txt";

  input clk;
  input [addr_width-1:0] read_address, write_address;
  input write;
  input [data_width-1:0] din;
  output [data_width-1:0] dout;
  reg [data_width-1:0] dout;

  reg [data_width-1:0] mem [2**addr_width-1:0];

  initial $readmemb(filename, mem);

  always @ (posedge clk) begin
    if (write)
      mem[write_address] <= din;
    dout <= mem[read_address]; // dout doesn't get din in this clock cycle 
                               // (this is due to Verilog non-blocking assignment "<=")
  end 
endmodule


module tri_state_controller(mem_cmd, mem_addr, enable, write); // enables tri-state driver only if CPU is trying to read smth from memory
                                                        // and address it is trying to read from is a location in memory block
  input [1:0] mem_cmd;
  input mem_addr; 
  output reg enable, write; 

  always @(*) begin
    if(mem_cmd == 2'b00 & mem_addr == 1'b0) begin
      enable = 1'b1;
    end else begin
      enable = 1'b0;
    end
    if(mem_cmd == 2'b10 & mem_addr == 1'b0) begin
      write = 1'b1;
    end else begin 
      write = 1'b0;
    end
  end
endmodule