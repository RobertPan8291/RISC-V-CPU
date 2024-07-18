module cpu_tb();

	// inputs
	reg clk, reset, s, load;
	reg [15:0] in;
	reg [15:0] mdata;

	// outputs
	wire [15:0] out;
	wire N, V, Z, w;
	wire [8:0] mem_addr;
	wire [1:0] mem_cmd; 

	// other
	reg err;
	
	cpu DUT(
	.clk(clk),
	.reset(reset),
	.s(s),
	.load(load),
	.in(in),
	.out(out),
	.N(N),
	.V(V),
	.Z(Z),
	.w(w),
	.mem_addr(mem_addr),
	.mem_cmd(mem_cmd),
	.mdata(mdata)
	);
	
	// clock
	initial begin
		forever   begin 
			clk = ~clk;
			#5;
		end
	end

	initial begin
	err = 1'b0; 
	clk = 1'b1;

    reset = 1; s = 0; load = 0; in = 16'b0;
    #10;
    reset = 0; 
    #10;

	/*
	Testing all ALU instructions on R0 = 3 and R1 = 2, with left shift and imm MOV only
	*/

	in = 16'b1101000000000011; // MOV R0, #3;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again. ensures it fully went thru fsm before checking reg
    #10;

	$display("Testing MOV R0, #3...");

    if (cpu_tb.DUT.DP.REGFILE.R0 != 16'b0000000000000011) begin
      	err = 1'b1;
      	$display("Whoop dee doo bozo, you failed! R0 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R0, 16'b0000000000000011);
    end
	else begin
		$display ("Good job baka! R0 is %b", cpu_tb.DUT.DP.REGFILE.R0);
	end

	err = 0;
	
	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1101000100000010; // MOV R1, #2;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing MOV R1, #2...");

    if (cpu_tb.DUT.DP.REGFILE.R1 !== 16'b0000000000000010) begin
      	err = 1;
      	$display("Whoop dee doo bozo, you failed! R1 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R1, 16'b0000000000000010);
    end
	else begin
		$display ("Good job baka! R1 is %b", cpu_tb.DUT.DP.REGFILE.R1);
	end

	// ADD TEST CASE 1

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1010000101001000; // ADD R2, R1, R0, LSL#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Intermediate reg check!");
	$display ("R0 is %b", cpu_tb.DUT.DP.REGFILE.R0);
	$display ("R1 is %b", cpu_tb.DUT.DP.REGFILE.R1);
	$display ("R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);

	$display("Testing ADD R2, R1, R0, LSL#1... internally");
    if (cpu_tb.DUT.DP.REGFILE.R2 !== 16'h8) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R2 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R2, 16'h8);
    end
	else begin
		$display ("Good job baka! R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);
	end

	err = 0;

	$display("Testing ADD R2, R1, R0, LSL#1... externally");
	if (out !== 16'h8) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! output is %b, expected %b.", out, 16'h8);
    end
	else begin
		$display ("Good job baka! output is %b", out);
	end
	
	// CMP TEST CASE 1

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1010100100001000; // CMP R1, R0, LSL#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display ("Intermediate reg check!");
	$display ("R0 is %b", cpu_tb.DUT.DP.REGFILE.R0);
	$display ("R1 is %b", cpu_tb.DUT.DP.REGFILE.R1);
	$display ("R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);

	$display ("Testing CMP R1, R0, LSL#1...");
    if (cpu_tb.DUT.DP.KYS.Z !== 1'b0 | cpu_tb.DUT.DP.KYS.V !== 1'b0 | cpu_tb.DUT.DP.KYS.N !== 1'b1 ) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed!");
		$display("Z = %b, expected %b", cpu_tb.DUT.DP.KYS.Z, 1'b0);
		$display("V = %b, expected %b", cpu_tb.DUT.DP.KYS.V, 1'b0);
		$display("N = %b, expected %b", cpu_tb.DUT.DP.KYS.N, 1'b1);
	end
	else begin
		$display ("Good job baka! Z = %b, V = %b, N = %b", cpu_tb.DUT.DP.KYS.Z, cpu_tb.DUT.DP.KYS.V, cpu_tb.DUT.DP.KYS.N);
	end

	// AND TEST CASE 1

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1011000101001000; // AND R2, R1, R0, LSL#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Intermediate reg check!");
	$display ("R0 is %b", cpu_tb.DUT.DP.REGFILE.R0);
	$display ("R1 is %b", cpu_tb.DUT.DP.REGFILE.R1);
	$display ("R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);

	$display("Testing AND R2, R1, R0, LSL#1... internally");
    if (cpu_tb.DUT.DP.REGFILE.R2 !== 16'h2) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R2 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R2, 16'h2);
    end
	else begin
		$display ("Good job baka! R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);
	end

	err = 0;

	$display("Testing AND R2, R1, R0, LSL#1... externally");
	if (out !== 16'h2) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! output is %b, expected %b.", out, 16'h2);
    end
	else begin
		$display ("Good job baka! output is %b", out);
	end	

	// MVN TEST CASE 1

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1011100001001001; // MVN R2, R1, LSL#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing MVN R2, R1, LSL#1... internally");
    if (cpu_tb.DUT.DP.REGFILE.R2 !== 16'b1111111111111011) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R2 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R2, 16'b1111111111111011);
    end
	else begin
		$display ("Good job baka! R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);
	end

	err = 0;

	$display("Testing MVN R2, R1, LSL#1... externally");
    if (out !== 16'b1111111111111011) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R2 is %b, expected %b.", out, 16'b1111111111111011);
    end
	else begin
		$display ("Good job baka! R2 is %b", out);
	end

	err = 0;

	/*
	Testing all ALU instructions on R4 = 8 and R3 = R0 LSL#1 (3*2 = 6) , with right shift
	*/

	in = 16'b1101010000001000; // MOV R4, #8;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again. ensures it fully went thru fsm before checking reg
    #10;

	$display("Testing MOV R4, #8...");

    if (cpu_tb.DUT.DP.REGFILE.R4 != 16'b0000000000001000) begin
      	err = 1'b1;
      	$display("Whoop dee doo bozo, you failed! R4 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R4, 16'b0000000000001000);
    end
	else begin
		$display ("Good job baka! R4 is %b", cpu_tb.DUT.DP.REGFILE.R4);
	end

	err = 0;
	
	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1100000001101000; // MOV R3, R0, LSL#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing MOV R3, R0, LSL#1...");

    if (cpu_tb.DUT.DP.REGFILE.R3 !== 16'b0000000000000110) begin
      	err = 1;
      	$display("Whoop dee doo bozo, you failed! R3 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R3, 16'b0000000000000110);
    end
	else begin
		$display ("Good job baka! R3 is %b", cpu_tb.DUT.DP.REGFILE.R3);
	end
	
	// ADD TEST CASE 2

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1010001101010100; // ADD R2, R3, R4, LSR#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing ADD R2, R3, R4, LSR#1... internally");
    if (cpu_tb.DUT.DP.REGFILE.R2 !== 16'hA) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R2 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R2, 16'hA);
    end
	else begin
		$display ("Good job baka! R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);
	end

	err = 0;

	$display("Testing ADD R2, R3, R4, LSR#1... externally");
	if (out !== 16'hA) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! output is %b, expected %b.", out, 16'hA);
    end
	else begin
		$display ("Good job baka! output is %b", out);
	end
	
	// CMP TEST CASE 2

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1010110000000011; // CMP R4, R3;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display ("Testing CMP R4, R3...");
    if (cpu_tb.DUT.DP.KYS.Z !== 1'b0 | cpu_tb.DUT.DP.KYS.V !== 1'b0 | cpu_tb.DUT.DP.KYS.N !== 1'b0 ) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed!");
		$display("Z = %b, expected %b", cpu_tb.DUT.DP.KYS.Z, 1'b0);
		$display("V = %b, expected %b", cpu_tb.DUT.DP.KYS.V, 1'b0);
		$display("N = %b, expected %b", cpu_tb.DUT.DP.KYS.N, 1'b0);
	end
	else begin
		$display ("Good job baka! Z = %b, V = %b, N = %b", cpu_tb.DUT.DP.KYS.Z, cpu_tb.DUT.DP.KYS.V, cpu_tb.DUT.DP.KYS.N);
	end

	// AND TEST CASE 2

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1011001101010100; // AND R2, R3, R4, LSR#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing AND R2, R3, R4, LSR#1... internally");
    if (cpu_tb.DUT.DP.REGFILE.R2 !== 16'h4) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R2 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R2, 16'h4);
    end
	else begin
		$display ("Good job baka! R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);
	end

	err = 0;

	$display("Testing AND R2, R3, R4, LSR#1... externally");
	if (out !== 16'h4) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! output is %b, expected %b.", out, 16'h4);
    end
	else begin
		$display ("Good job baka! output is %b", out);
	end	

	// MVN TEST CASE 2

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1011100010101011; // MVN R5, R3, LSL#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing MVN R5, R3, LSL#1... internally");
    if (cpu_tb.DUT.DP.REGFILE.R5 !== 16'b1111111111110011) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R5 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R5, 16'b1111111111110011);
    end
	else begin
		$display ("Good job baka! R5 is %b", cpu_tb.DUT.DP.REGFILE.R5);
	end

	err = 0;

	$display("Testing MVN R5, R3, LSL#1... externally");
    if (out !== 16'b1111111111110011) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R5 is %b, expected %b.", out, 16'b1111111111110011);
    end
	else begin
		$display ("Good job baka! R5 is %b", out);
	end

	/*
	Testing all ALU instructions on R0 = -1 and R1 = R0
	*/

	in = 16'b1101000011111111; // MOV R0, #-1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again. ensures it fully went thru fsm before checking reg
    #10;

	$display("Testing MOV R0, #-1...");

    if (cpu_tb.DUT.DP.REGFILE.R0 != 16'b1111111111111111) begin
      	err = 1'b1;
      	$display("Whoop dee doo bozo, you failed! R0 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R0, 16'b1111111111111111);
    end
	else begin
		$display ("Good job baka! R0 is %b", cpu_tb.DUT.DP.REGFILE.R0);
	end

	err = 0;
	
	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1100000000100000; // MOV R1, R0 ;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing MOV R1, R0...");

    if (cpu_tb.DUT.DP.REGFILE.R1 !== 16'b1111111111111111) begin
      	err = 1;
      	$display("Whoop dee doo bozo, you failed! R1 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R1, 16'b1111111111111111);
    end
	else begin
		$display ("Good job baka! R1 is %b", cpu_tb.DUT.DP.REGFILE.R1);
	end
	
	// ADD TEST CASE 3

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1010000001101001; // ADD R3, R0, R1, LSL#1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing ADD R3, R0, R1, LSL#1... internally");
    if (cpu_tb.DUT.DP.REGFILE.R3 !== 16'b1111111111111101) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R3 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R3, 16'b1111111111111101);
    end
	else begin
		$display ("Good job baka! R3 is %b", cpu_tb.DUT.DP.REGFILE.R3);
	end

	err = 0;

	$display("Testing ADD R3, R0, R1, LSL#1... externally");
	if (out !== 16'b1111111111111101) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! output is %b, expected %b.", out, 16'b1111111111111101);
    end
	else begin
		$display ("Good job baka! output is %b", out);
	end
	
	// CMP TEST CASE 3

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1010100000000001; // CMP R0, R1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display ("Testing CMP R0, R1...");
    if (cpu_tb.DUT.DP.KYS.Z !== 1'b1 | cpu_tb.DUT.DP.KYS.V !== 1'b0 | cpu_tb.DUT.DP.KYS.N !== 1'b0 ) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed!");
		$display("Z = %b, expected %b", cpu_tb.DUT.DP.KYS.Z, 1'b1);
		$display("V = %b, expected %b", cpu_tb.DUT.DP.KYS.V, 1'b0);
		$display("N = %b, expected %b", cpu_tb.DUT.DP.KYS.N, 1'b0);
	end
	else begin
		$display ("Good job baka! Z = %b, V = %b, N = %b", cpu_tb.DUT.DP.KYS.Z, cpu_tb.DUT.DP.KYS.V, cpu_tb.DUT.DP.KYS.N);
	end
	
	// AND TEST CASE 3

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1011001101010100; // AND R2, R0, R1;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing AND R2, R3, R4, LSR#1... internally");
    if (cpu_tb.DUT.DP.REGFILE.R2 !== 16'h4) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R2 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R2, 16'h4);
    end
	else begin
		$display ("Good job baka! R2 is %b", cpu_tb.DUT.DP.REGFILE.R2);
	end

	err = 0;

	$display("Testing AND R2, R3, R4, LSR#1... externally");
	if (out !== 16'h4) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! output is %b, expected %b.", out, 16'h4);
    end
	else begin
		$display ("Good job baka! output is %b", out);
	end	

	// MVN TEST CASE 3

	err = 0;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1011100011100000; // MVN R7, R0;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	$display("Testing MVN R7, R0... internally");
    if (cpu_tb.DUT.DP.REGFILE.R7 !== 16'b0000000000000000) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R7 is %b, expected %b.", cpu_tb.DUT.DP.REGFILE.R7, 16'b0000000000000000);
    end
	else begin
		$display ("Good job baka! R7 is %b", cpu_tb.DUT.DP.REGFILE.R7);
	end

	err = 0;

	$display("Testing MVN R7, R0... externally");
    if (out !== 16'b0000000000000000) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! output is %b, expected %b.", out, 16'b0000000000000000);
    end
	else begin
		$display ("Good job baka! output is %b", out);
	end


	/* 
	Overflow test
	*/   

	@(negedge clk);
	in = 16'b1101011001111111; // MOV R6, #127;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again. ensures it fully went thru fsm before checking reg
    #10;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1011100011000110; // MVN R6, R6; Now the number stored is 1111111110000000 
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	@(negedge clk);
	in = 16'b1101011101111111; // MOV R7, #127;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again. ensures it fully went thru fsm before checking reg
    #10;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1011100011100111; // MVN R7, R7; Now the number stored is 1111111110000000 
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1100000011110111; // MOV R7, R7, LSR#1; Now the number stored is 0111111111000000 
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10;
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;

	@(negedge clk); // wait for falling edge of clock before changing inputs
    in = 16'b1010111000000111; // CMP R6, R7;
    load = 1;
    #10;
    load = 0;
    s = 1;
    #10
    s = 0;
    @(posedge w); // wait for w to go high again
    #10;	


	$display("Testing MVN R7, R0... internally");
    if (cpu_tb.DUT.DP.REGFILE.R6 !== 16'b1111111110000000 || cpu_tb.DUT.DP.REGFILE.R7 !== 16'b0111111111000000) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! R6 is %b, expected %b. R7 is %b, expected %b", cpu_tb.DUT.DP.REGFILE.R6, 16'b1111111100000000, cpu_tb.DUT.DP.REGFILE.R7, 16'b0111111110000000);
    end
	else begin
		$display ("Good job baka! R7 is %b", cpu_tb.DUT.DP.REGFILE.R7);
	end

	$display("Testing CMP R6, R7 externally");
    if (V !== 1'b1) begin
      	err = 1;
    	$display("Whoop dee doo bozo, you failed! V is %b, expected %b.", V, 1'b1);
    end
	else begin
		$display ("Good job baka! V is %b", V);
	end


    $stop;


	/* testing sximm 8	
	in = 8'b10100111;
	#5;
	if (out != 16'b1111111110100111) begin
		$display ("Whoop dee doo bozo, you failed! out is %b, expected %b.", out, 16'b1111111110100111);
	end
	else begin
		$display ("Passed");
	end
	#5;
	
	in = 8'b00001001;
	#5;
	if (out != 16'b0000000000001001) begin
		$display ("Whoop dee doo bozo, you failed! out is %b, expected %b.", out, 16'b0000000000001001);
	end
	else begin
		$display ("Passed");
	end
	*/

	
	/* testing sximm 5
	in = 5'b10111;
	#5;
	if (out != 16'b1111111111110111) begin
		$display ("Whoop dee doo bozo, you failed! out is %b, expected %b.", out, 16'b1111111111110111);
	end
	else begin
		$display ("Passed");
	end
	#5;

	in = 5'b01001;
	#5;
	if (out != 16'b0000000000001001) begin
		$display ("Whoop dee doo bozo, you failed! out is %b, expected %b.", out, 16'b0000000000001001);
	end
	else begin
		$display ("Passed");
	end
	*/

	end
	
endmodule
	
	