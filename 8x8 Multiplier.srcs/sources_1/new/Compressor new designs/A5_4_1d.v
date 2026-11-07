`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2026 04:38:05 PM
// Design Name: 
// Module Name: A5_4_1d
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


module A5_4_1d(input X1,X2,X3,X4, output S,C);
  wire w1 = X1 ^ X2;
  wire w2 = X3 | X4;
  wire h  = (X1&X2) | (X3&X4);
  assign S = w1 ^ w2;
  assign C = w1 ? w2 : h;
endmodule