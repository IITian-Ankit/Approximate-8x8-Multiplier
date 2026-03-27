`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2026 12:13:14 AM
// Design Name: 
// Module Name: Multiplier_4x4
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



module Multiplier_4x4(input [3:0] a,b,
output [7:0] pdt);
//First multiply b (all the 3 bits) with each and every bit of a and then add them by left shifting by 2
wire[3:0] pp0, pp1, pp2, pp3;
assign pp0 = a&{4{b[0]}};
assign pp1 = a& {4{b[1]}};
assign pp2 = a& {4{b[2]}};
assign pp3 = a& {4{b[3]}};

//now we left shift according and add
assign pdt = pp0 + (pp1<<1) + (pp2<<2) + (pp3<<3);
endmodule
