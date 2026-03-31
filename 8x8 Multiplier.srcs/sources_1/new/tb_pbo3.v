`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2026 01:13:18 AM
// Design Name: 
// Module Name: tb_pbo3
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


module tb_pbo3();
reg [7:0] A;
reg [3:0] B;
wire [11:0] P;

PBO_3 du1(.A(A),.B(B),.P(P));
initial begin
    // Case 1: both operands non-power-of-2
    A = 8'b11111111;  B = 4'b1111;  // 255 x 15 = 3825, PBO-3 will differ
    #50;
    
    // Case 2: triggers carry in approximated columns
    A = 8'b10110111;  B = 4'b1011;  // 183 x 11 = 2013
    #50;
    
    // Case 3: small values to see error clearly  
    A = 8'b00000111;  B = 4'b0111;  // 7 x 7 = 49, PBO-3 may give 55
    #50;
    
    // Case 4: power of 2 - should be exact
    A = 8'b00000100;  B = 4'b0100;  // 4 x 4 = 16, exact guaranteed
    #50;
end
endmodule
