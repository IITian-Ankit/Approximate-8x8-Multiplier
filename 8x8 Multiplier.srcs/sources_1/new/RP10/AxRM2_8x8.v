`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2026 01:12:21 AM
// Design Name: 
// Module Name: AxRM2_8x8
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


module AxRM2_8x8(A,B,P);
input [7:0] A,B;
output [15:0] P;

wire [3:0] A_H,A_L,B_H,B_L;

assign A_L = A[3:0];
assign A_H = A[7:4];
assign B_L = B[3:0];
assign B_H = B[7:4];

wire [7:0] pp1,pp2,pp3,pp4;

Mul2b_4x4 M1(.A(A_L),.B(B_L),.P(pp1));
Mul2b_4x4 M2(.A(A_H),.B(B_L),.P(pp2));
exact_4x4_using_2x2 M3(.A(A_L),.B(B_H),.P(pp3));
exact_4x4_using_2x2 M4(.A(A_H),.B(B_H),.P(pp4));

assign P[3:0] = pp1[3:0];

//column 4
wire s4,c4_to_5;
Full_Adder COL4_FA1(.a(pp1[4]),.b(pp2[0]),.Cin(pp3[0]),.
Cout(c4_to_5),.sum(s4));

//column 5
wire s5,c5_to_6;
Full_Adder COL5_FA1(.a(pp1[5]),.b(pp2[1]),.Cin(pp3[1]),.Cout(c5_to_6),.sum(s5));

//column 6
wire c6_to_7,s6;
Full_Adder COL6_FA1(.a(pp1[6]),.b(pp2[2]),.Cin(pp3[2]),.Cout(c6_to_7),.sum(s6));

//column 7
wire c7_to_8,s7;
Full_Adder COL7_FA1(.a(pp1[7]),.b(pp2[3]),.Cin(pp3[3]),.Cout(c7_to_8),.sum(s7));

//column 8
wire c8_to_9,s8;
Full_Adder COL8_FA1(.a(pp4[0]),.b(pp2[4]),.Cin(pp3[4]),.Cout(c8_to_9),.sum(s8));

//column 9
wire c9_to_10,s9;
Full_Adder COL9_FA1(.a(pp4[1]),.b(pp2[5]),.Cin(pp3[5]),.Cout(c9_to_10),.sum(s9));

//column 10
wire c10_to_11,s10;
Full_Adder COL10_FA1(.a(pp4[2]),.b(pp2[6]),.Cin(pp3[6]),.Cout(c10_to_11),.sum(s10));

//column 11
wire c11_to_12,s11;
Full_Adder COL11_FA1(.a(pp4[3]),.b(pp2[7]),.Cin(pp3[7]),.Cout(c11_to_12),.sum(s11));

wire [11:0] a,b;

assign a = {pp4[7],pp4[6],pp4[5],pp4[4],s11,s10,s9,s8,s7,s6,s5,s4};
assign b = {1'b0,1'b0,1'b0,c11_to_12,c10_to_11,c9_to_10,c8_to_9,c7_to_8,c6_to_7,c5_to_6,c4_to_5,1'b0};

wire co;
cla_12bit CLA1(.A(a),.B(b),.Cin(1'b0),.Sum(P[15:4]),.Cout(co));

endmodule
