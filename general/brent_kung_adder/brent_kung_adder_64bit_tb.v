module bka_tb;

    reg [63:0] a, b;        // 64-bit inputs
    reg cin;                // Carry-in input
    wire [63:0] s;          // Sum output
    wire cout;              // Carry-out output
    integer i;              // Loop counter
    integer success_count = 0;  // Count of successful tests

    // Instantiate the adder module
    bka uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    // Test vectors
    reg [63:0] test_a [9:0];      // Array to hold 64-bit 'a' inputs
    reg [63:0] test_b [9:0];      // Array to hold 64-bit 'b' inputs
    reg test_cin [9:0];           // Array to hold carry-in values
    reg [63:0] expected_s [9:0];  // Expected sum results
    reg expected_cout [9:0];      // Expected carry-out results

    initial begin
        // Initialize test vectors
test_a[0] = 64'hb1251b14db93efe6; test_b[0] = 64'h3b1c452da1aefadc; test_cin[0] = 1; expected_s[0] = 64'hec4160427d42eac3; expected_cout[0] = 0;
test_a[1] = 64'hc06bb37b75ffdfe4; test_b[1] = 64'h85036b62ba333a12; test_cin[1] = 0; expected_s[1] = 64'h456f1ede303319f6; expected_cout[1] = 1;
test_a[2] = 64'hf73a4ac5621cea98; test_b[2] = 64'h242b92d441105cc4; test_cin[2] = 1; expected_s[2] = 64'h1b65dd99a32d475d; expected_cout[2] = 1;
test_a[3] = 64'hd6c3e55d94875a00; test_b[3] = 64'hc946e1821440c8b1; test_cin[3] = 1; expected_s[3] = 64'ha00ac6dfa8c822b2; expected_cout[3] = 1;
test_a[4] = 64'hbf6daaff725d5bbb; test_b[4] = 64'he8ad0b0cb8897f78; test_cin[4] = 1; expected_s[4] = 64'ha81ab60c2ae6db34; expected_cout[4] = 1;
test_a[5] = 64'h7d2661f7a45e75dd; test_b[5] = 64'hf0e48ad47dfc07d5; test_cin[5] = 0; expected_s[5] = 64'h6e0aeccc225a7db2; expected_cout[5] = 1;
test_a[6] = 64'h2c7dd60f77bd488f; test_b[6] = 64'hc0c27f5746d39435; test_cin[6] = 0; expected_s[6] = 64'hed405566be90dcc4; expected_cout[6] = 0;
test_a[7] = 64'h7d022f915ca98743; test_b[7] = 64'h436b0e684ab42eeb; test_cin[7] = 0; expected_s[7] = 64'hc06d3df9a75db62e; expected_cout[7] = 0;
test_a[8] = 64'h1f806afca4a626c6; test_b[8] = 64'h481b9841f478879e; test_cin[8] = 1; expected_s[8] = 64'h679c033e991eae65; expected_cout[8] = 0;
test_a[9] = 64'h0a7aa81600dc1a8d; test_b[9] = 64'h831e0d39ae89f07f; test_cin[9] = 0; expected_s[9] = 64'h8d98b54faf660b0c; expected_cout[9] = 0;
        // Add the remaining test values based on your input
        // ...

        // Begin the test
        for (i = 0; i < 5; i = i + 1) begin
            a = test_a[i];
            b = test_b[i];
            cin = test_cin[i];
            #10;  // Wait for outputs to stabilize

            // Check the result
            if (s == expected_s[i] && cout == expected_cout[i]) begin
                $display("Test %d: SUCCESS", i);
                success_count = success_count + 1;
            end else begin
                $display("Test %d: FAIL -- Expected S: %h, Cout: %b; Got S: %h, Cout: %b", 
                          i, expected_s[i], expected_cout[i], s, cout);
            end
        end

        // Display the overall result
        $display("Success count: %d / %d", success_count, 5);
        $finish;
    end

endmodule
