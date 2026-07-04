`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2026 01:22:02 AM
// Design Name: 
// Module Name: NxFA
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


module NxFA(A,B,Cin,S,Cout);
input A,B,Cin;
output S,Cout;

wire n1,n2;
assign n1 = (~(A|B));
assign n2 = (~Cin);
assign S = (~(Cin|n1));
assign Cout = (~(n1|n2));
endmodule