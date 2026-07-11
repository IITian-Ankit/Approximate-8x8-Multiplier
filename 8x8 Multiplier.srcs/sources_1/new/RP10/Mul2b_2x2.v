`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2026 11:06:25 PM
// Design Name: 
// Module Name: Mul2b_2x2
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


module Mul2b_2x2(A,B,P);
input [1:0] A,B;
output [3:0] P;

assign P[1] = A[1];
assign P[0] = A[0]&B[0];
assign P[2] = A[1]&B[1];
assign P[3] = 1'b0;
endmodule
