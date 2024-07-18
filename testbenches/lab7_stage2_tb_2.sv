module lab7_stage2_tb_2; 
  reg [3:0] KEY;
  reg [9:0] SW;
  wire [9:0] LEDR; 
  wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  reg err;
  
  lab7_top DUT(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);

  initial forever begin
    KEY[0] = 0; #5;
    KEY[0] = 1; #5;
  end
  
  initial begin
        err = 0;
        KEY[1] = 1'b0;
		  
		  @(negedge KEY[0]); // wait until next falling edge of clock

		  KEY[1] = 1'b1; // reset de-asserted, PC still undefined if as in Figure 4

        #10; // waiting for RST state to cause reset of PC

		  // NOTE: your program counter register output should be called PC and be inside a module with instance name CPU
        if (DUT.CPU.PC !== 9'b0) begin
          err = 1;
          $display("FAILED: PC is not reset to zero, PC is %b, reset_pc = %b, load_pc = %b, current state is %b", DUT.CPU.PC, DUT.CPU.reset_pc, DUT.CPU.load_pc, DUT.CPU.fsm_controller.present_state); $stop; end

        @(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 1 *before* executing MOV R0, X
		  
		  
		  if (DUT.CPU.PC !== 9'h1) begin
          err = 1;
          $display("FAILED: PC should be 0.");
          $stop;
        end
		  
		  @(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 2 *after* executing MOV R0, X

        if (DUT.CPU.PC !== 9'h2) begin
          err = 1;
          $display("FAILED: PC should be 1.");
          $stop;
        end

        if (DUT.CPU.DP.REGFILE.R6 !== 16'h2a) begin
          err = 1;
          $display("FAILED: R6 should be 2a.");
          $stop;
        end  // because MOV R0, X should have occurred
		  
		  
        @(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 3 *after* executing LDR R1, [R0]

        if (DUT.CPU.PC !== 9'h3) begin
          err = 1;
          $display("FAILED: PC should be 3.");
          $stop;
        end

        if (DUT.CPU.DP.REGFILE.R5 !== 16'h6E) begin
          err = 1;
          $display("FAILED: R5 should be 06E.");
          $stop;
          end

		@(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 4 *after* executing MOV R2, Y

        if (DUT.CPU.PC !== 9'h4) begin
          err = 1;
          $display("FAILED: PC should be 4.");
          $stop;
          end

        if (DUT.MEM.mem[108] !== 16'h2a) begin
          err = 1;
          $display("FAILED: MEM[108] should be 2a, right now it is %b.", DUT.MEM.mem[108]);
          $stop;
          end
			 
    if (~err)
      $display("INTERFACE OK");
      $stop;

  end
endmodule