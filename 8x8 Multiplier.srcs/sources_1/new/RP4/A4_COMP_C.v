`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2026 02:58:03 AM
// Design Name: 
// Module Name: A4_COMP_C
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


module A4_COMP_C( input  X1,
    input  X2,
    input  X3,
    input  X4,
    output Sum,
    output Carry
);
    wire A;
    wire B;
    wire C;

    // First XOR
    assign A = X1 ^ X2;

    // AND gate
    assign B = X1 & X2;

    // OR gate
    assign C = X3 | X4;

    // Sum XOR
    assign Sum = A ^ C;

    // 2:1 MUX for Carry
    // Select = A
    // A = 0 -> B
    // A = 1 -> C
    assign Carry = A ? C : B;

endmodule
