`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2026 09:56:56 AM
// Design Name: 
// Module Name: A6_b_1d
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


module A6_b_1d(X1,X2,X3,X4,S,C);
input X1,X2,X3,X4;
output S,C;

wire w1,a,w2,P;
assign w1 = (X1|X2);
assign a = (X1&X2);
assign w2 = (X3|a);
assign P = (w1^w2);
assign S = (P^X4);
mux_2x1 M(.a(w2),.b(X4),.s(P),.y(C));
endmodule
