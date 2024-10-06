`timescale 1ns / 1ps

module tb_wallace_multiplier;

  // Testbench variables
  reg [63:0] a, b;           // Inputs to the multiplier
  wire [127:0] sum_out1;      // First partial sum output
  wire [127:0] sum_out2;      // Second partial sum output
  reg [127:0] expected_result; // Expected result from multiplication

  // Instantiate the wallace multiplier
  wallace_multiplier uut (
    .a(a),
    .b(b),
    .sum_out1(sum_out1),
    .sum_out2(sum_out2)
  );

  // Clock for simulation (optional, if needed for other synchronous modules)
  reg clk;

  initial begin
    // Initialize variables
    clk = 0;
    a = 0;
    b = 0;

    // Test 1: Simple Test
    a = 64'd15;
    b = 64'd3;
    #10; // Wait for the result
    expected_result = a * b;
    check_result();

    // Test 2: Edge Case Test (Large numbers)
    a = 64'hFFFFFFFFFFFFFFFF;
    b = 64'hFFFFFFFFFFFFFFFF;
    #10; // Wait for the result
    expected_result = a * b;
    check_result();

    // Test 3: Random Tests
    a = $random;
    b = $random;
    #10; // Wait for the result
    expected_result = a * b;
    check_result();

    // Test 4: Another Random Test
    a = $random;
    b = $random;
    #10; // Wait for the result
    expected_result = a * b;
    check_result();

    // Test 5: Small numbers
    a = 64'd4;
    b = 64'd5;
    #10; // Wait for the result
    expected_result = a * b;
    check_result();

    // End of simulation
    $display("All tests completed.");
    $finish;
  end

  // Clock generation (if needed)
  always #5 clk = ~clk;

  // Task to check the result
  task check_result;
    begin
      // Compare the sum_out1 and sum_out2 to the expected result
      if ((sum_out1 + sum_out2) === expected_result) begin
        $display("PASS: a = %d, b = %d, result = %d", a, b, sum_out1 + sum_out2);
      end else begin
        $display("FAIL: a = %d, b = %d, expected = %d, got = %d", a, b, expected_result, sum_out1 + sum_out2);
      end
    end
  endtask

endmodule
