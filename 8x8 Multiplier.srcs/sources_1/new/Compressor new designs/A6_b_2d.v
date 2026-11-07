`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2026 03:27:20 PM
// Design Name: 
// Module Name: A6_b_2d
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


module A6_b_2d(X1,X2,X3,X4,C,S);
input X1,X2,X3,X4;
output C,S;
  wire q  = X1 & X2;
  wire p  = X1 ^ X2;
  wire c0 = (X1&X2)|(X1&X3)|(X2&X3);
  wire c1 = X1 | X2 | X3;
  wire s0 = ~q & (p ^ X3);
  assign C = X4 ? c1 : c0;
  assign S = X4 ^ s0;
endmodule
