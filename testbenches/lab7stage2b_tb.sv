module lab7_stage2b_tb;
  reg [3:0] KEY;
  reg [9:0] SW;
  wire [9:0] LEDR; 
  wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  reg err;

  lab7_top DUT(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);

  wire [3:0] present_state = DUT.CPU.fsm_controller.present_state;
  wire clk = DUT.CPU.fsm_controller.clk;
  wire reset = DUT.CPU.fsm_controller.reset;

  initial forever begin
    KEY[0] = 0; #5;
    KEY[0] = 1; #5;
  end

  initial begin
        err = 0;
        KEY[1] = 1'b0;
		  
		  if (DUT.MEM.mem[0] !== 16'b1101000000000100) begin
            err = 1;
            $display("FAILED: mem[0] wrong; please set data.txt using Figure 6");
            $stop;
        end
        if (DUT.MEM.mem[1] !== 16'b1101000100000101) begin
            err = 1;
            $display("FAILED: mem[1] wrong; please set data.txt using Figure 6");
            $stop;
            end
        if (DUT.MEM.mem[2] !== 16'b1000000000100000) begin
            err = 1;
            $display("FAILED: mem[2] wrong; please set data.txt using Figure 6");
            $stop;
            end
        if (DUT.MEM.mem[3] !== 16'b1110000000000000) begin
            err = 1;
            $display("FAILED: mem[3] wrong; please set data.txt using Figure 6");
            $stop;
            end

        @(negedge KEY[0]); // wait until next falling edge of clock

        KEY[1] = 1'b1; // reset de-asserted, PC still undefined if as in Figure 4

        #15; // waiting for RST state to cause reset of PC
		  
		  if (DUT.CPU.PC !== 9'b0) begin
          err = 1;
          $display("FAILED: PC is not reset to zero, PC is %b, reset_pc = %b, load_pc = %b, current state is %b", DUT.CPU.PC, DUT.CPU.reset_pc, DUT.CPU.load_pc, DUT.CPU.fsm_controller.present_state);
          $stop;
        end

        @(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 1 *before* executing MOV R0, X

        if (DUT.CPU.PC !== 9'h1) begin
          err = 1;
          $display("FAILED: PC should be 1.");
          $stop;
        end

        @(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 2 *after* executing MOV R0, X

        if (DUT.CPU.PC !== 9'h2) begin
          err = 1;
          $display("FAILED: PC should be 2.");
          $stop;
        end

        if (DUT.CPU.DP.REGFILE.R0 !== 16'h4) begin
          err = 1;
          $display("FAILED: R0 should be 4.");
          $stop;
        end  // because MOV R0, X should have occurred
		  
		   @(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 3 *after* executing LDR R1, [R0]

		  
		  if (DUT.CPU.PC !== 9'h3) begin
          err = 1;
          $display("FAILED: PC should be 3.");
          $stop;
        end

        if (DUT.CPU.DP.REGFILE.R1 !== 16'h5) begin
          err = 1;
          $display("FAILED: R1 should be 5.");
          $stop;
          end
			 
			@(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 4 *after* executing MOV R2, Y

        if (DUT.CPU.PC !== 9'h4) begin
          err = 1;
          $display("FAILED: PC should be 4.");
          $stop;
          end
			 
		    if (DUT.MEM.mem[4] !== 16'h5) begin 
			 err = 1; 
			 $display("FAILED: mem[4] wrong; looks like your STR isn't working"); 
			 $stop; 
			 end

    if (~err)
      $display("INTERFACE OK");
      $stop;

  end
endmodule