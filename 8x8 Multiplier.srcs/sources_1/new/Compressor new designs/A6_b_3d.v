`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2026 02:38:46 PM
// Design Name: 
// Module Name: A6_b_3d
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


module A6_b_3d(X1,X2,X3,X4,C,S);
input X1,X2,X3,X4;
output C,S;
    wire c1 = X1 | X2 | X3;
    wire c0 = (X1&X2)|(X1&X3)|(X2&X3);
    assign C = X4 ? c1 : c0;
    
wire w1,w2,w3;

assign w1 = (X1|X2);
assign w3 = X4;
assign w2 = (X3|(X1&X2));

assign S = (w1^w2^w3);
endmodule
