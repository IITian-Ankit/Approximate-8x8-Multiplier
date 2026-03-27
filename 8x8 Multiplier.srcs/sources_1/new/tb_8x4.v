`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2026 05:25:42 PM
// Design Name: 
// Module Name: tb_8x4
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


module tb_8x4();
reg [7:0]A;
reg [3:0] B;
wire [11:0] P;

multiplier_8x4 mu1(.A(A),.B(B),.P(P));

initial begin
A = 8'b00000011;
B = 4'b0100;
#50;
A = 8'b01000101;
B = 4'b1010;
#50;
A = 8'b10110011;
B = 4'b0101;
#100;
$finish;
end
endmodule
