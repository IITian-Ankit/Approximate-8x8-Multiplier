`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2026 01:16:13 AM
// Design Name: 
// Module Name: NxHA1
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


module NxHA1(A,B,Cout,S);
input A,B;
output Cout,S;

assign Cout = A;
wire Nb;
assign Nb = (~B);
assign S = (~(A|Nb));
endmodule