module mult(
  input  [63:0] a,  // 64-bit input a
  input  [63:0] b,  // 64-bit input b
  output [127:0] s1, // 128-bit output s1
  output [127:0] s2  // 128-bit output s2
);

  genvar c, r; // c is column, r is row

  // Declare the wires for the partial products (pp)
  wire [127:0] pp[127:0];  // Partial product wires forming the triangle

  generate
    for (c = 0; c < 128; c = c + 1) begin : layer_pp
      if (c < 64) begin
        // First half of the triangle (increasing height)
        for (r = 0; r <= c; r = r + 1) begin
          assign pp[c][r] = a[r] & b[c - r];
        end
      end else begin
        // Second half of the triangle (decreasing height)
        for (r = 0; r < (128 - c); r = r + 1) begin
          assign pp[c][r] = a[64 - r - 1] & b[r + (c - 64 + 1)];
        end
      end
    end
  endgenerate


endmodule
