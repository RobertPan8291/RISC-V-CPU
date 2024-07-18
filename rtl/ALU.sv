module ALU(Ain, Bin, ALUop, out, Z, V, N);
	input [15:0] Ain, Bin;
	input [1:0] ALUop;
	output reg [15:0] out;
	output reg Z, V, N; // Z = 1 if equal, V = 1 if overflow, N = 1 if negative
	
	reg negoverflow; 
	reg posoverflow; 
	
	always @(*) begin
			posoverflow = 1'b0;
			negoverflow = 1'b0;
			N = 1'b0;
			V = 1'b0;
			Z = 1'b0;
		case(ALUop) // one output from ALU goes to C pipeline reg
			2'b00: out = Ain + Bin; // addition operation
			2'b01: out = Ain - Bin; // subtraction operation
			2'b10: out = Ain & Bin; // and
			2'b11: out = ~Bin;	// negation
			default: out = 16'bxxxxxxxxxxxxxxxx;
		endcase
		
		
		
		if(ALUop == 2'b01) begin // checks for overflow only in subtraction operation
			if(Ain[15] == 1'b0 & Bin[15] == 1'b1)begin // checks MSB, AIN is positive, BIN is negative
				if(out[15] == 1'b1) begin
					V = 1'b1;
					posoverflow = 1'b1;
				end
				else begin
					V = 1'b0;
				end
			end
			
			else if(Ain[15] == 1'b1 & Bin[15] == 1'b0)begin // checks MSB, AIN is negative, BIN is positive
				if(out[15] == 1'b0) begin
					V = 1'b1;
					negoverflow = 1'b1;
				end
				else begin
					V = 1'b0;
				end
				
			end
		
		
			if(out[15] == 1'b1) begin // if MSB is 1, N is flagged																		
				N = 1'b1;
			end 
			
			else begin
				N = 1'b0;
			end 
			posoverflow = 1'b0;
			negoverflow = 1'b0;
			
				
			if(out == 16'b0000000000000000) begin
				Z = 1'b1;
			end else begin 
				Z = 1'b0;
			end
			
		end
		else begin
			posoverflow = 1'b0;
			negoverflow = 1'b0;
			N = 1'b0;
			V = 1'b0;
			Z = 1'b0;
		end
	end
	
endmodule
