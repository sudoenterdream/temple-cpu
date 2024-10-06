module ram (
    input clk,
    input we,
    input [63:0] addr,
    input [63:0] data_in,
    output reg [63:0] data_out
);

reg [7:0] memory [0:1023]; // 8-bit memory

always @(posedge clk) begin  // writing
    if (we) begin
        memory[addr]     <= data_in[7:0];     // LSB stored at the lowest address
        memory[addr + 1] <= data_in[15:8];
        memory[addr + 2] <= data_in[23:16];
        memory[addr + 3] <= data_in[31:24];
        memory[addr + 4] <= data_in[39:32];
        memory[addr + 5] <= data_in[47:40];
        memory[addr + 6] <= data_in[55:48];
        memory[addr + 7] <= data_in[63:56];   // MSB stored at the highest address
    end
end

always @(posedge clk) begin
    if (!we) begin
        data_out <= { memory[addr + 7], memory[addr + 6], memory[addr + 5], memory[addr + 4],
        memory[addr + 3], memory[addr + 2], memory[addr + 1], memory[addr]};
    end
end

endmodule
