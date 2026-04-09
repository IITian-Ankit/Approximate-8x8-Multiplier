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
/*
PBO_3_8X8 dut1(.A(A),.B(B),.P(P));
*/
/*
PBO_5_8X8 dut2(.A(A),.B(B),.P(P));
*/
/*
PBO_7_8X8 dut3(.A(A),.B(B),.P(P));
*/
/*
PBOM8_73Y dur4(.A(A),.B(B),.P(P));
*/
integer i;
reg [15:0] exact;
integer error;
initial begin
    $display("A\tB\tApprox\tExact\tError");

    // random testing
    for(i = 0; i < 20; i = i + 1) begin
        A = $random % 256;
        B = $random % 256;
        #10;
        exact = A * B;
        error = exact - P;
        $display("%d\t%d\t%d\t%d\t%d", A, B, P, exact, error);
    end

    $finish;
end
endmodule
