`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2026 12:33:33 AM
// Design Name: 
// Module Name: exact_2x2
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


module exact_2x2(A,B,P);
input [1:0] A,B;
output [3:0] P;

wire [1:0] pp[1:0];
genvar i;
generate 
for(i=0;i<2;i=i+1)begin
assign pp[i] = A &{2{B[i]}};
end
endgenerate

assign P[0] = pp[0][0];

wire c1_to_2;
Half_Adder COL1_HA1(.a(pp[0][1]),.b(pp[1][0]),.sum(P[1]),.carry(c1_to_2));
Half_Adder COL2_HA1(.a(pp[1][1]),.b(c1_to_2),.sum(P[2]),.carry(P[3]));
endmodule
