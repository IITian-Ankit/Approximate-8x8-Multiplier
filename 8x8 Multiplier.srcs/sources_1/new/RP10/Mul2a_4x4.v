`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2026 12:50:02 AM
// Design Name: 
// Module Name: Mul2a_4x4
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


module Mul2a_4x4(A,B,P);
input [3:0] A,B;
output [7:0] P;

wire [1:0] A_L,B_L,A_H,B_H;
assign A_L = A[1:0];
assign B_L = B[1:0];
assign A_H = A[3:2];
assign B_H = B[3:2];
wire [3:0] P1,P2,P3,P4;
Mul2a_2x2 M1(.A(A_L),.B(B_L),.P(P1));
Mul2a_2x2 M2(.A(A_H),.B(B_L),.P(P2));
Mul2a_2x2 M3(.A(A_L),.B(B_H),.P(P3));
Mul2a_2x2 M4(.A(A_H),.B(B_H),.P(P4));

//column 0 and 1
assign P[1:0] = P1[1:0];

//Stage 1
//column 2
wire c2_to_3;
Full_Adder COL2_FA1(.a(P1[2]),.b(P2[0]),.Cin(P3[0]),.
Cout(c2_to_3),.sum(P[2]));

//column 3
wire s3,c3_to_4;
Full_Adder COL3_FA1(.a(P1[3]),.b(P2[1]),.Cin(P3[1]),.Cout(c3_to_4),.sum(s3));

//column 4
wire s4,c4_to_5;
Full_Adder COL4_FA1(.a(P2[2]),.b(P3[2]),.Cin(P4[0]),.Cout(c4_to_5),.sum(s4));

//column 5
wire s5,c5_to_6;
Full_Adder COL5_FA1(.a(P2[3]),.b(P3[3]),.Cin(P4[1]),.Cout(c5_to_6),.sum(s5));

//Stage 2
//column 3
wire c3_to_4_;
Half_Adder COL3_HA1(.a(s3),.b(c2_to_3),.
sum(P[3]),.carry(c3_to_4_));

//column 4
wire c4_to_5_,s4_;
Half_Adder COL4_HA1(.a(s4),.b(c3_to_4),.sum(s4_),.carry(c4_to_5_));

//column 5
wire c5_to_6_,s5_;
Half_Adder COL5_HA1(.a(s5),.b(c4_to_5),.sum(s5_),.carry(c5_to_6_));

//column 6
wire c6_to_7_,s6_;
Half_Adder COL6_HA1(.a(P4[2]),.b(c5_to_6),.sum(s6_),.carry(c6_to_7_));

wire [3:0] a,b;

assign a = {P4[3],s6_,s5_,s4_};
assign b = {c6_to_7_,c5_to_6_,c4_to_5_,c3_to_4_};

wire Co,Q,H;
cla_4bit CLA(.A(a),.B(b),.Cin(1'b0),.Sum(P[7:4]),.Cout(Co),.PG(Q),.GG(H));

endmodule
