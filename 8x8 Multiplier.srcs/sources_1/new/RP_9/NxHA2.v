`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2026 01:19:53 AM
// Design Name: 
// Module Name: NxHA2
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


module NxHA2(A,B,Cout,S);
input A,B;
output Cout,S;

assign Cout = (A&B);
wire Nb;
assign Nb = (~B);
assign S = (~(A|Nb));
endmodule
