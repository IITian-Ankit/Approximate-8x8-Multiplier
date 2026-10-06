`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2026 02:38:07 AM
// Design Name: 
// Module Name: A4_COMP_B
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


module A4_COMP_B(X1,X2,X3,X4,Sum,Carry);
input X1,X2,X3,X4;
output Sum,Carry;

    wire n1, n2;
    wire xnor1, xnor2;

    // Carry section
    // First NOR: X3 and X4
    assign n1 = ~(X3 | X4);

    // Second NOR: X1 and X2
    assign n2 = ~(X1 | X2);

    // Final NOR
    assign Carry = ~(n1 | n2);


    // Sum section
    // XNOR of X3 and X4
    assign xnor1 = ~(X3 ^ X4);

    // XNOR of X1 and X2
    assign xnor2 = ~(X1 ^ X2);

    // Final OR
    assign Sum = xnor1 | xnor2;

endmodule