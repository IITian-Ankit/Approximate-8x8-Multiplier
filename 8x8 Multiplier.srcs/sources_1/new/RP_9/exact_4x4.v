`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2026 01:37:19 AM
// Design Name: 
// Module Name: exact_4x4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module exact_4x4(A,B,P);
input [3:0] A,B;
output [7:0] P;

    wire [3:0] pp0, pp1, pp2, pp3;

    // Partial product generation
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    //Stage 1: pp0 + pp1
    wire s1_1, c1_1;
    wire s1_2, c1_2;
    wire s1_3, c1_3;
    wire s1_4, c1_4;

    assign P[0] = pp0[0];

    Half_Adder ha1 (.a(pp0[1]), .b(pp1[0]), .sum(s1_1), .carry(c1_1));
    Full_Adder fa1 (.a(pp0[2]), .b(pp1[1]), .Cin(c1_1), .sum(s1_2), .Cout(c1_2));
    Full_Adder fa2 (.a(pp0[3]), .b(pp1[2]), .Cin(c1_2), .sum(s1_3), .Cout(c1_3));
    Half_Adder ha2 (.a(pp1[3]), .b(c1_3),   .sum(s1_4), .carry(c1_4));

    //Stage 2
    wire s2_1, c2_1;
    wire s2_2, c2_2;
    wire s2_3, c2_3;
    wire s2_4, c2_4;

    assign P[1] = s1_1;

    Half_Adder ha3 (.a(s1_2), .b(pp2[0]), .sum(s2_1), .carry(c2_1));
    Full_Adder fa3 (.a(s1_3), .b(pp2[1]), .Cin(c2_1), .sum(s2_2), .Cout(c2_2));
    Full_Adder fa4 (.a(s1_4), .b(pp2[2]), .Cin(c2_2), .sum(s2_3), .Cout(c2_3));
    Full_Adder fa5 (.a(pp2[3]), .b(c1_4), .Cin(c2_3), .sum(s2_4), .Cout(c2_4));

    //Stage 3
    wire s3_1, c3_1;
    wire s3_2, c3_2;
    wire s3_3, c3_3;
    wire s3_4, c3_4;

    assign P[2] = s2_1;

    Half_Adder ha4 (.a(s2_2), .b(pp3[0]), .sum(s3_1), .carry(c3_1));
    Full_Adder fa6 (.a(s2_3), .b(pp3[1]), .Cin(c3_1), .sum(s3_2), .Cout(c3_2));
    Full_Adder fa7 (.a(s2_4), .b(pp3[2]), .Cin(c3_2), .sum(s3_3), .Cout(c3_3));
    Full_Adder fa8 (.a(pp3[3]), .b(c2_4), .Cin(c3_3), .sum(s3_4), .Cout(c3_4));

    // Final outputs
    assign P[3] = s3_1;
    assign P[4] = s3_2;
    assign P[5] = s3_3;
    assign P[6] = s3_4;
    assign P[7] = c3_4;

endmodule
