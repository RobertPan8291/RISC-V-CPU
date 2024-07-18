module lab7_stage1_tb_2;
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
        #5
        KEY[1] = 1'b0;
		  
		  @(negedge KEY[0]); // wait until next falling edge of clock

        KEY[1] = 1'b1; // reset de-asserted, PC still undefined if as in Figure 4

        #15; // waiting for RST state to cause reset of PC
		  
		  if (DUT.CPU.PC !== 9'b0) begin
          err = 1;
          $display("FAILED: PC is not reset to zero, PC is %b, reset_pc = %b, load_pc = %b, current state is %b", DUT.CPU.PC, DUT.CPU.reset_pc, DUT.CPU.load_pc, DUT.CPU.fsm_controller.present_state); $stop; end
			 
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

		   if (DUT.CPU.DP.REGFILE.R0 !== 16'h5) begin
          err = 1;
          $display("FAILED: R0 should be 7.");
          $stop;
        end  // because MOV R0, 5 should have occurred
		  
		  @(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 3 *after* executing LDR R1, [R0]

        if (DUT.CPU.PC !== 9'h3) begin
          err = 1;
          $display("FAILED: PC should be 3.");
          $stop;
        end

        if (DUT.CPU.DP.REGFILE.R1 !== 16'h3) begin
          err = 1;
          $display("FAILED: R1 should be 3.");
          $stop;
          end
			 
		 @(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 4 *after* executing MOV R2, Y

        if (DUT.CPU.PC !== 9'h4) begin
          err = 1;
          $display("FAILED: PC should be 4.");
          $stop;
          end
			 
		
        if (DUT.CPU.DP.REGFILE.R2 !== 16'hA) begin
          err = 1;
          $display("FAILED: R2 should be 10.");
          $stop;
          end
			 
			#40
			if (DUT.CPU.N !== 1'b1) begin
          err = 1;
          $display("FAILED: N should be 1.");
          $stop;
          end
	
			@(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 2 *after* executing MOV R0, X
			
			 
		    if (DUT.CPU.PC !== 9'h5) begin
          err = 1;
          $display("FAILED: PC should be 5.");
          $stop;
          end
			 
		@(posedge DUT.CPU.PC or negedge DUT.CPU.PC);  // wait here until PC changes; autograder expects PC set to 2 *after* executing MOV R0, X

        if (DUT.CPU.PC !== 9'h6) begin
          err = 1;
          $display("FAILED: PC should be 6.");
          $stop;
        end
		  
		  if (DUT.CPU.DP.REGFILE.R3 !== 16'h1) begin
          err = 1;
          $display("FAILED: R3 should be 1.");
          $stop;
         end
			
		@(posedge DUT.CPU.PC or negedge DUT.CPU.PC); 
		
		   if (DUT.CPU.PC !== 9'h7) begin
          err = 1;
          $display("FAILED: PC should be 7.");
          $stop;
        end
		
		if (DUT.CPU.DP.REGFILE.R4 !== 16'h0) begin
          err = 1;
          $display("FAILED: R4 should be 0.");
          $stop;
         end
			
		@(posedge DUT.CPU.PC or negedge DUT.CPU.PC);
	
	   if (DUT.CPU.PC !== 9'h8) begin
          err = 1;
          $display("FAILED: PC should be 8.");
          $stop;
        end	
		  
		  	if (DUT.CPU.DP.REGFILE.R4 !== 16'b1111111111111111) begin
          err = 1;
          $display("FAILED: R4 should be all 1s.");
          $stop;
         end

            
    if (~err)
      $display("INTERFACE OK");
      $stop;

  end
endmodule
			 