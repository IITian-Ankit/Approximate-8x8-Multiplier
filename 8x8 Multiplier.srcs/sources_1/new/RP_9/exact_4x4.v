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




endmodule
