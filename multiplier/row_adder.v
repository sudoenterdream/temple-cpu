module row_adder (
    input  [127:0] r1,
    input  [127:0] r2,
    input  [127:0] r3,
    output [127:0] sum1,
    output [127:0] sum2
);

    wire [127:0] sum;
    wire [127:0] carry;
    integer i;

    // Determine the valid range based on non-zero bits in inputs
    // This helps in avoiding unnecessary hardware for padded regions
    // For demonstration, we'll assume full 128-bit range
    // In practice, you can calculate the valid range based on inputs

    genvar idx;
    generate
        for (idx = 0; idx < 128; idx = idx + 1) begin : add_bits
            if ((r1[idx] !== 1'b0) || (r2[idx] !== 1'b0) || (r3[idx] !== 1'b0)) begin
                // Sum the bits using full adders
                assign {carry[idx], sum[idx]} = r1[idx] + r2[idx] + r3[idx];
            end else begin
                // If all bits are zero, assign zero to sum and carry
                assign sum[idx] = 1'b0;
                assign carry[idx] = 1'b0;
            end
        end
    endgenerate

    // Shift the carry bits left by one to align with the next significant bit
    assign sum1 = sum;
    assign sum2 = (carry << 1);

endmodule
