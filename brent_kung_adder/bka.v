module bka(
    input [63:0] a,          // 64-bit input a
    input [63:0] b,          // 64-bit input b
    input cin,
    output [63:0] s,         // 64-bit sum output
    output cout              // Carry-out output
);

    // Generate and Propagate Signals
    wire [63:0] p;
    wire [63:0] g;
    
    assign p = a ^ b;
    assign g = a & b;

// Compute carry into bit 1
wire g_0;
assign g_0 = g[0] | (p[0] & cin);

function [1:0] black_cell;
    input pj, gj, pi, gi;
    begin
        black_cell[1] = pi & pj;         // pk is the MSB
        black_cell[0] = gj | (pj & gi);  // gk is the LSB
    end
endfunction

function grey_cell;
    input pj, gj, pi, gi;
    begin
        grey_cell = gj | (pj & gi);
    end
endfunction


    
    //////////////////////////////////////////
    // Upward Reduction Phase
    //////////////////////////////////////////
    
    // Level 1 Reduction Phase
    wire g_63_62, p_63_62;
    wire g_61_60, p_61_60;
    wire g_59_58, p_59_58;
    wire g_57_56, p_57_56;
    wire g_55_54, p_55_54;
    wire g_53_52, p_53_52;
    wire g_51_50, p_51_50;
    wire g_49_48, p_49_48;
    wire g_47_46, p_47_46;
    wire g_45_44, p_45_44;
    wire g_43_42, p_43_42;
    wire g_41_40, p_41_40;
    wire g_39_38, p_39_38;
    wire g_37_36, p_37_36;
    wire g_35_34, p_35_34;
    wire g_33_32, p_33_32;
    wire g_31_30, p_31_30;
    wire g_29_28, p_29_28;
    wire g_27_26, p_27_26;
    wire g_25_24, p_25_24;
    wire g_23_22, p_23_22;
    wire g_21_20, p_21_20;
    wire g_19_18, p_19_18;
    wire g_17_16, p_17_16;
    wire g_15_14, p_15_14;
    wire g_13_12, p_13_12;
    wire g_11_10, p_11_10;
    wire g_9_8,   p_9_8;
    wire g_7_6,   p_7_6;
    wire g_5_4,   p_5_4;
    wire g_3_2,   p_3_2;
    wire g_1_0,   p_1_0;

// Level 1 Assignments using the modified black_cell function
assign {p_63_62, g_63_62} = black_cell(p[63], g[63], p[62], g[62]);
assign {p_61_60, g_61_60} = black_cell(p[61], g[61], p[60], g[60]);
assign {p_59_58, g_59_58} = black_cell(p[59], g[59], p[58], g[58]);
assign {p_57_56, g_57_56} = black_cell(p[57], g[57], p[56], g[56]);
assign {p_55_54, g_55_54} = black_cell(p[55], g[55], p[54], g[54]);
assign {p_53_52, g_53_52} = black_cell(p[53], g[53], p[52], g[52]);
assign {p_51_50, g_51_50} = black_cell(p[51], g[51], p[50], g[50]);
assign {p_49_48, g_49_48} = black_cell(p[49], g[49], p[48], g[48]);
assign {p_47_46, g_47_46} = black_cell(p[47], g[47], p[46], g[46]);
assign {p_45_44, g_45_44} = black_cell(p[45], g[45], p[44], g[44]);
assign {p_43_42, g_43_42} = black_cell(p[43], g[43], p[42], g[42]);
assign {p_41_40, g_41_40} = black_cell(p[41], g[41], p[40], g[40]);
assign {p_39_38, g_39_38} = black_cell(p[39], g[39], p[38], g[38]);
assign {p_37_36, g_37_36} = black_cell(p[37], g[37], p[36], g[36]);
assign {p_35_34, g_35_34} = black_cell(p[35], g[35], p[34], g[34]);
assign {p_33_32, g_33_32} = black_cell(p[33], g[33], p[32], g[32]);
assign {p_31_30, g_31_30} = black_cell(p[31], g[31], p[30], g[30]);
assign {p_29_28, g_29_28} = black_cell(p[29], g[29], p[28], g[28]);
assign {p_27_26, g_27_26} = black_cell(p[27], g[27], p[26], g[26]);
assign {p_25_24, g_25_24} = black_cell(p[25], g[25], p[24], g[24]);
assign {p_23_22, g_23_22} = black_cell(p[23], g[23], p[22], g[22]);
assign {p_21_20, g_21_20} = black_cell(p[21], g[21], p[20], g[20]);
assign {p_19_18, g_19_18} = black_cell(p[19], g[19], p[18], g[18]);
assign {p_17_16, g_17_16} = black_cell(p[17], g[17], p[16], g[16]);
assign {p_15_14, g_15_14} = black_cell(p[15], g[15], p[14], g[14]);
assign {p_13_12, g_13_12} = black_cell(p[13], g[13], p[12], g[12]);
assign {p_11_10, g_11_10} = black_cell(p[11], g[11], p[10], g[10]);
assign {p_9_8, g_9_8} = black_cell(p[9], g[9], p[8], g[8]);
assign {p_7_6, g_7_6} = black_cell(p[7], g[7], p[6], g[6]);
assign {p_5_4, g_5_4} = black_cell(p[5], g[5], p[4], g[4]);
assign {p_3_2, g_3_2} = black_cell(p[3], g[3], p[2], g[2]);
assign {p_1_0, g_1_0} = black_cell(p[1], g[1], p[0], g_0);

// Level 2 Reduction Phase
wire g_63_60, p_63_60;
wire g_59_56, p_59_56;
wire g_55_52, p_55_52;
wire g_51_48, p_51_48;
wire g_47_44, p_47_44;
wire g_43_40, p_43_40;
wire g_39_36, p_39_36;
wire g_35_32, p_35_32;
wire g_31_28, p_31_28;
wire g_27_24, p_27_24;
wire g_23_20, p_23_20;
wire g_19_16, p_19_16;
wire g_15_12, p_15_12;
wire g_11_8,  p_11_8;
wire g_7_4,   p_7_4;
wire g_3_0,   p_3_0;
    
// Level 2 Assignments using the black_cell function
assign {p_63_60, g_63_60} = black_cell(p_63_62, g_63_62, p_61_60, g_61_60);
assign {p_59_56, g_59_56} = black_cell(p_59_58, g_59_58, p_57_56, g_57_56);
assign {p_55_52, g_55_52} = black_cell(p_55_54, g_55_54, p_53_52, g_53_52);
assign {p_51_48, g_51_48} = black_cell(p_51_50, g_51_50, p_49_48, g_49_48);
assign {p_47_44, g_47_44} = black_cell(p_47_46, g_47_46, p_45_44, g_45_44);
assign {p_43_40, g_43_40} = black_cell(p_43_42, g_43_42, p_41_40, g_41_40);
assign {p_39_36, g_39_36} = black_cell(p_39_38, g_39_38, p_37_36, g_37_36);
assign {p_35_32, g_35_32} = black_cell(p_35_34, g_35_34, p_33_32, g_33_32);
assign {p_31_28, g_31_28} = black_cell(p_31_30, g_31_30, p_29_28, g_29_28);
assign {p_27_24, g_27_24} = black_cell(p_27_26, g_27_26, p_25_24, g_25_24);
assign {p_23_20, g_23_20} = black_cell(p_23_22, g_23_22, p_21_20, g_21_20);
assign {p_19_16, g_19_16} = black_cell(p_19_18, g_19_18, p_17_16, g_17_16);
assign {p_15_12, g_15_12} = black_cell(p_15_14, g_15_14, p_13_12, g_13_12);
assign {p_11_8, g_11_8}   = black_cell(p_11_10, g_11_10, p_9_8, g_9_8);
assign {p_7_4, g_7_4}     = black_cell(p_7_6, g_7_6, p_5_4, g_5_4);
assign {p_3_0, g_3_0}     = black_cell(p_3_2, g_3_2, p_1_0, g_1_0);

// Level 3 Reduction Phase
wire g_63_56, p_63_56;
wire g_55_48, p_55_48;
wire g_47_40, p_47_40;
wire g_39_32, p_39_32;
wire g_31_24, p_31_24;
wire g_23_16, p_23_16;
wire g_15_8,  p_15_8;
wire g_7_0,   p_7_0;
    
// Level 3 Assignments using the black_cell function
assign {p_63_56, g_63_56} = black_cell(p_63_60, g_63_60, p_59_56, g_59_56);
assign {p_55_48, g_55_48} = black_cell(p_55_52, g_55_52, p_51_48, g_51_48);
assign {p_47_40, g_47_40} = black_cell(p_47_44, g_47_44, p_43_40, g_43_40);
assign {p_39_32, g_39_32} = black_cell(p_39_36, g_39_36, p_35_32, g_35_32);
assign {p_31_24, g_31_24} = black_cell(p_31_28, g_31_28, p_27_24, g_27_24);
assign {p_23_16, g_23_16} = black_cell(p_23_20, g_23_20, p_19_16, g_19_16);
assign {p_15_8, g_15_8}   = black_cell(p_15_12, g_15_12, p_11_8, g_11_8);
assign {p_7_0, g_7_0}     = black_cell(p_7_4, g_7_4, p_3_0, g_3_0);

    
// Level 4 Reduction Phase
wire g_63_48, p_63_48;
wire g_47_32, p_47_32;
wire g_31_16, p_31_16;
wire g_15_0,  p_15_0;
    
// Level 4 Assignments using the black_cell function
assign {p_63_48, g_63_48} = black_cell(p_63_56, g_63_56, p_55_48, g_55_48);
assign {p_47_32, g_47_32} = black_cell(p_47_40, g_47_40, p_39_32, g_39_32);
assign {p_31_16, g_31_16} = black_cell(p_31_24, g_31_24, p_23_16, g_23_16);
assign {p_15_0, g_15_0}   = black_cell(p_15_8, g_15_8, p_7_0, g_7_0);

    
// Level 5 Reduction Phase
wire g_63_32, p_63_32;
wire g_31_0,  p_31_0;

// Level 5 Assignments using the black_cell function
assign {p_63_32, g_63_32} = black_cell(p_63_48, g_63_48, p_47_32, g_47_32);
assign {p_31_0, g_31_0}   = black_cell(p_31_16, g_31_16, p_15_0, g_15_0);


// Level 6 Reduction Phase (Final Level)
wire g_63_0, p_63_0;

// Level 6 Assignments using the black_cell function
assign {p_63_0, g_63_0} = black_cell(p_63_32, g_63_32, p_31_0, g_31_0);

    
    //////////////////////////////////////////
    // Downward Phase
    //////////////////////////////////////////
    
wire p_11_0, p_13_0, p_17_0, p_19_0, p_21_0, p_23_0, 
p_25_0, p_27_0, p_29_0, p_33_0, p_35_0, p_37_0, p_39_0, 
p_41_0, p_43_0, p_45_0, p_47_0, p_49_0, p_51_0, p_53_0, 
p_55_0, p_57_0, p_59_0, p_5_0, p_61_0, p_9_0;

wire g_10_0, g_11_0, g_12_0, g_13_0, g_14_0, g_16_0, g_17_0, 
g_18_0, g_19_0, g_20_0, g_21_0, g_22_0, g_23_0, g_24_0, 
g_25_0, g_26_0, g_27_0, g_28_0, g_29_0, g_2_0, g_30_0, 
g_32_0, g_33_0, g_34_0, g_35_0, g_36_0, g_37_0, g_38_0, g_39_0, 
g_40_0, g_41_0, g_42_0, g_43_0, g_44_0, g_45_0, g_46_0, 
g_47_0, g_48_0, g_49_0, g_4_0, g_50_0, g_51_0, g_52_0, g_53_0, 
g_54_0, g_55_0, g_56_0, g_57_0, g_58_0, g_59_0, g_5_0, g_60_0, 
g_61_0, g_62_0, g_6_0, g_8_0, g_9_0;
    
// Downward Phase - First Level

assign g_2_0   = grey_cell(p[2], g[2], p_1_0, g_1_0);
assign g_4_0   = grey_cell(p[4], g[4], p_3_0, g_3_0);
assign g_8_0   = grey_cell(p[8], g[8], p_7_0, g_7_0);
assign g_16_0 = grey_cell(p[16], g[16], p_15_0, g_15_0);
assign g_32_0 = grey_cell(p[32], g[32], p_31_0, g_31_0);

assign {p_5_0, g_5_0}   = black_cell(p_5_4, g_5_4, p_3_0, g_3_0);
assign {p_9_0, g_9_0}   = black_cell(p_9_8, g_9_8, p_7_0, g_7_0);
assign {p_11_0, g_11_0} = black_cell(p_11_8, g_11_8, p_7_0, g_7_0);
assign {p_17_0, g_17_0} = black_cell(p_17_16, g_17_16, p_15_0, g_15_0);
assign {p_19_0, g_19_0} = black_cell(p_19_16, g_19_16, p_15_0, g_15_0);
assign {p_23_0, g_23_0} = black_cell(p_23_16, g_23_16, p_15_0, g_15_0);
assign {p_33_0, g_33_0} = black_cell(p_33_32, g_33_32, p_31_0, g_31_0);
assign {p_35_0, g_35_0} = black_cell(p_35_32, g_35_32, p_31_0, g_31_0);
assign {p_39_0, g_39_0} = black_cell(p_39_32, g_39_32, p_31_0, g_31_0);
assign {p_47_0, g_47_0} = black_cell(p_47_32, g_47_32, p_31_0, g_31_0);

    
// Downward Phase - Second Level using the black_cell function
assign g_6_0   = grey_cell(p[6], g[6], p_5_0, g_5_0);
assign g_10_0 = grey_cell(p[10], g[10], p_9_0, g_9_0);
assign g_12_0 = grey_cell(p[12], g[12], p_11_0, g_11_0);
assign g_18_0 = grey_cell(p[18], g[18], p_17_0, g_17_0);
assign g_20_0 = grey_cell(p[20], g[20], p_19_0, g_19_0);
assign g_24_0 = grey_cell(p[24], g[24], p_23_0, g_23_0);
assign g_34_0 = grey_cell(p[34], g[34], p_33_0, g_33_0);
assign g_36_0 = grey_cell(p[36], g[36], p_35_0, g_35_0);
assign g_40_0 = grey_cell(p[40], g[40], p_39_0, g_39_0);
assign g_48_0 = grey_cell(p[48], g[48], p_47_0, g_47_0);

assign {p_13_0, g_13_0} = black_cell(p_13_12, g_13_12, p_11_0, g_11_0);
assign {p_21_0, g_21_0} = black_cell(p_21_20, g_21_20, p_19_0, g_19_0);
assign {p_25_0, g_25_0} = black_cell(p_25_24, g_25_24, p_23_0, g_23_0);
assign {p_27_0, g_27_0} = black_cell(p_27_24, g_27_24, p_23_0, g_23_0);
assign {p_37_0, g_37_0} = black_cell(p_37_36, g_37_36, p_35_0, g_35_0);
assign {p_41_0, g_41_0} = black_cell(p_41_40, g_41_40, p_39_0, g_39_0);
assign {p_43_0, g_43_0} = black_cell(p_43_40, g_43_40, p_39_0, g_39_0);
assign {p_49_0, g_49_0} = black_cell(p_49_48, g_49_48, p_47_0, g_47_0);
assign {p_51_0, g_51_0} = black_cell(p_51_48, g_51_48, p_47_0, g_47_0);
assign {p_55_0, g_55_0} = black_cell(p_55_48, g_55_48, p_47_0, g_47_0);

    
// Downward Phase - Third Level using the black_cell function
assign g_14_0 = grey_cell(p[14], g[14], p_13_0, g_13_0);
assign g_22_0 = grey_cell(p[22], g[22], p_21_0, g_21_0);
assign g_26_0 = grey_cell(p[26], g[26], p_25_0, g_25_0);
assign g_28_0 = grey_cell(p[28], g[28], p_27_0, g_27_0);
assign g_38_0 = grey_cell(p[38], g[38], p_37_0, g_37_0);
assign g_42_0 = grey_cell(p[42], g[42], p_41_0, g_41_0);
assign g_44_0 = grey_cell(p[44], g[44], p_43_0, g_43_0);
assign g_50_0 = grey_cell(p[50], g[50], p_49_0, g_49_0);
assign g_52_0 = grey_cell(p[52], g[52], p_51_0, g_51_0);
assign g_56_0 = grey_cell(p[56], g[56], p_55_0, g_55_0);

assign {p_29_0, g_29_0} = black_cell(p_29_28, g_29_28, p_27_0, g_27_0);
assign {p_45_0, g_45_0} = black_cell(p_45_44, g_45_44, p_43_0, g_43_0);
assign {p_53_0, g_53_0} = black_cell(p_53_52, g_53_52, p_51_0, g_51_0);
assign {p_57_0, g_57_0} = black_cell(p_57_56, g_57_56, p_55_0, g_55_0);
assign {p_59_0, g_59_0} = black_cell(p_59_56, g_59_56, p_55_0, g_55_0);


// Downward Phase - Fourth Level
assign g_30_0 = grey_cell(p[30], g[30], p_29_0, g_29_0);
assign g_46_0 = grey_cell(p[46], g[46], p_45_0, g_45_0);
assign g_54_0 = grey_cell(p[54], g[54], p_53_0, g_53_0);
assign g_58_0 = grey_cell(p[58], g[58], p_57_0, g_57_0);
assign g_60_0 = grey_cell(p[60], g[60], p_59_0, g_59_0);

assign {p_61_0, g_61_0} = black_cell(p_61_60, g_61_60, p_59_0, g_59_0);

    
// Final level
assign g_62_0 = grey_cell(p[62], g[62], p_61_0, g_61_0);

    
    //////////////////////////////////////////
    // Sum and Carry-Out Calculation
    //////////////////////////////////////////
    
    assign s[0] = p[0] ^ cin;
    assign s[1] = p[1] ^ g_0;
    assign s[2] = p[2] ^ g_1_0;
    assign s[3] = p[3] ^ g_2_0;
    assign s[4] = p[4] ^ g_3_0;
    assign s[5] = p[5] ^ g_4_0;
    assign s[6] = p[6] ^ g_5_0;
    assign s[7] = p[7] ^ g_6_0;
    assign s[8] = p[8] ^ g_7_0;
    assign s[9] = p[9] ^ g_8_0;
    assign s[10] = p[10] ^ g_9_0;
    assign s[11] = p[11] ^ g_10_0;
    assign s[12] = p[12] ^ g_11_0;
    assign s[13] = p[13] ^ g_12_0;
    assign s[14] = p[14] ^ g_13_0;
    assign s[15] = p[15] ^ g_14_0;
    assign s[16] = p[16] ^ g_15_0;
    assign s[17] = p[17] ^ g_16_0;
    assign s[18] = p[18] ^ g_17_0;
    assign s[19] = p[19] ^ g_18_0;
    assign s[20] = p[20] ^ g_19_0;
    assign s[21] = p[21] ^ g_20_0;
    assign s[22] = p[22] ^ g_21_0;
    assign s[23] = p[23] ^ g_22_0;
    assign s[24] = p[24] ^ g_23_0;
    assign s[25] = p[25] ^ g_24_0;
    assign s[26] = p[26] ^ g_25_0;
    assign s[27] = p[27] ^ g_26_0;
    assign s[28] = p[28] ^ g_27_0;
    assign s[29] = p[29] ^ g_28_0;
    assign s[30] = p[30] ^ g_29_0;
    assign s[31] = p[31] ^ g_30_0;
    assign s[32] = p[32] ^ g_31_0;
    assign s[33] = p[33] ^ g_32_0;
    assign s[34] = p[34] ^ g_33_0;
    assign s[35] = p[35] ^ g_34_0;
    assign s[36] = p[36] ^ g_35_0;
    assign s[37] = p[37] ^ g_36_0;
    assign s[38] = p[38] ^ g_37_0;
    assign s[39] = p[39] ^ g_38_0;
    assign s[40] = p[40] ^ g_39_0;
    assign s[41] = p[41] ^ g_40_0;
    assign s[42] = p[42] ^ g_41_0;
    assign s[43] = p[43] ^ g_42_0;
    assign s[44] = p[44] ^ g_43_0;
    assign s[45] = p[45] ^ g_44_0;
    assign s[46] = p[46] ^ g_45_0;
    assign s[47] = p[47] ^ g_46_0;
    assign s[48] = p[48] ^ g_47_0;
    assign s[49] = p[49] ^ g_48_0;
    assign s[50] = p[50] ^ g_49_0;
    assign s[51] = p[51] ^ g_50_0;
    assign s[52] = p[52] ^ g_51_0;
    assign s[53] = p[53] ^ g_52_0;
    assign s[54] = p[54] ^ g_53_0;
    assign s[55] = p[55] ^ g_54_0;
    assign s[56] = p[56] ^ g_55_0;
    assign s[57] = p[57] ^ g_56_0;
    assign s[58] = p[58] ^ g_57_0;
    assign s[59] = p[59] ^ g_58_0;
    assign s[60] = p[60] ^ g_59_0;
    assign s[61] = p[61] ^ g_60_0;
    assign s[62] = p[62] ^ g_61_0;
    assign s[63] = p[63] ^ g_62_0;
    
    assign cout = g_63_0; 

endmodule
