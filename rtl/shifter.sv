module shifter(in, shift, sout);
    input [15:0] in;
    input [1:0] shift;
    output reg[15:0] sout;
    
    always @(*) begin
        case(shift)
            2'b00: sout = in;   // no shift
            2'b01: sout = {in[14:0], 1'b0};   // left shift, LSB is 0
            2'b10: sout = {1'b0, in[15:1]};   // right shift, MSB is 0
            2'b11: sout = {in[15], in[15:1]}; // right shift with most significant bit preserved
            default: sout = 16'bxxxxxxxxxxxxxxxx;
        endcase
    end

endmodule