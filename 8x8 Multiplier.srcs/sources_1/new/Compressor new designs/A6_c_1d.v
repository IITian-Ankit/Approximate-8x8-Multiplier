`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 03:44:41 PM
// Design Name: 
// Module Name: A6_c_1d
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


module A6_c_1d(X1,X2,X3,X4,C,S);
input X1,X2,X3,X4;
output C,S;

wire t;
assign t = X1&X2;

wire w1;
assign w1 = X2|X1;

wire a3;
assign a3 = X3&t;

wire w2;
assign w2 = (~(t|X3));

wire w3;
assign w3 = X4|a3;

wire X;
assign X = (~(w2^w3));

assign S = X^w1;

mux_2x1 MUX(.a(w3),.b(w1),.s(X),.y(C));

endmodule
