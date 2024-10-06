module ALU(
    input [63:0] in1, in2,
    input [4:0] fn,
    output reg [63:0] out,
    output zero, overflow, 
    output cout
);

wire [63:0] addition_result, subtraction_result, and_result, or_result, xor_result, not_result, nand_result, nor_result, xnor_result;
wire carry_out_add, carry_out_sub;

// Arithmetic Operations
assign {carry_out_add, addition_result} = in1 + in2; // Capture the carry-out
assign {carry_out_sub, subtraction_result} = in1 - in2; // Proper subtraction (two's complement)

// Logical Operations
assign not_result = ~in2;
assign and_result = in1 & in2;
assign or_result = in1 | in2;
assign xor_result = in1 ^ in2;
assign nand_result = ~(in1 & in2);
assign nor_result = ~(in1 | in2);
assign xnor_result = ~(in1 ^ in2);

// Output Logic
always @(*) begin
    case(fn)
        5'b00000: out = addition_result;
        5'b00001: out = subtraction_result;
        5'b00010: out = and_result;
        5'b00011: out = or_result;
        5'b00100: out = xor_result;
        5'b00101: out = not_result;
        5'b00110: out = nand_result;
        5'b00111: out = nor_result;
        5'b01000: out = xnor_result;        
        default: out = 64'b0;
    endcase
end

// Flag calculations
assign zero = (out == 64'b0);
assign cout = (fn == 5'b00000) ? carry_out_add : (fn == 5'b00001) ? carry_out_sub : 1'b0;
assign overflow = (fn == 5'b00000 && (in1[63] == in2[63]) && (out[63] != in1[63])) || 
                  (fn == 5'b00001 && (in1[63] != in2[63]) && (out[63] != in1[63]));

endmodule
