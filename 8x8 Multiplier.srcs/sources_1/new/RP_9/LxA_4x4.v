`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2026 01:08:59 AM
// Design Name: 
// Module Name: LxA_4x4
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


module LxA_4x4(A,B,P);
input [3:0] A,B;
output [7:0] P;

wire [3:0] pp[3:0];
genvar i;
generate 
for(i=0;i<4;i=i+1)begin
 assign pp[i] = A & {4{B[i]}}; 
end
endgenerate

//column 0
assign P[0] = pp[0][0];

//column 1
wire c1_to_2;
NxHA2 COL1_HA1(.A(pp[0][1]),.B(pp[1][0]),.Cout(c1_to_2),.S(P[1]));

//column 2
wire e20;
assign e20 = pp[0][2]|pp[2][0];
wire c2_to_3;
NxFA COL2_FA1(.A(e20),.B(pp[1][1]),.Cin(c1_to_2),.S(P[2]),.Cout(c2_to_3));

//column 3
wire e30,e21,F3,f30,f21;
assign e30 = pp[0][3]|pp[3][0];
assign e21 = pp[1][2]|pp[2][1];
assign f30 = pp[0][3]&pp[3][0];
assign f21 = pp[1][2]&pp[2][1];
assign F3 = f30+f21; 
wire Ci;
assign Ci = F3 + c2_to_3;
wire c3_to_4;
NxFA COL3_FA1(.A(e30),.B(e21),.Cin(Ci),.S(P[3]),.Cout(c3_to_4));

//column 4
wire c4_to_5,e31;
assign e31 = pp[1][3]|pp[3][1];
NxFA COL4_FA1(.A(e31),.B(pp[2][2]),.Cin(c3_to_4),.S(P[4]),.Cout(c4_to_5));

//column 5
wire c5_to_6;
NxFA COL5_FA1(.A(pp[2][3]),.B(pp[3][2]),.Cin(c4_to_5),.S(P[5]),.Cout(c5_to_6));

//column 6
NxHA2 COL6_HA1(.A(pp[3][3]),.B(c5_to_6),.Cout(P[7]),.S(P[6]));

endmodule
