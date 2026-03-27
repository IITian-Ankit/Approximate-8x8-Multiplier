`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2026 01:46:53 AM
// Design Name: 
// Module Name: tb_8x8
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


module tb_8x8();
reg [7:0] A,B;
wire [15:0] P;

multiplier_8x8 dut1(.A(A),.B(B),.P(P));
initial begin
A = 8'b10111011;
B = 8'b00000010;
#100;
A = 8'b00001000;
B = 8'b00000011;
#100;
$finish;
end
endmodule
