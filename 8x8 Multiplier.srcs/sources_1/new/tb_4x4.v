`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2026 04:20:23 PM
// Design Name: 
// Module Name: tb_4x4
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


module tb_4x4();
reg [3:0] a,b;
wire [7:0] pdt;

Multiplier_4x4 dut(
.a(a),
.b(b),
.pdt(pdt)
);
initial begin
a = 4'b0101;
b=4'b1000;
#100;
a = 4'b0000;
#100;
$finish;
end
endmodule
