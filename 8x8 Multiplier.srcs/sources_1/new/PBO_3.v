`timescale 1ns / 1ps
`include "Full_Adder.v"
`include "Half_Adder.v"

// Create Date: 03/25/2026 11:51:56 PM
// Design Name: PBO_3 Approximate Multiplier Design 1 (8x4)
// Module Name: PBO_3

module PBO_3(input[7:0]A,
input [3:0] B,
output [11:0]P);

wire[7:0] pp0,pp1,pp2,pp3;
assign pp0 = A & {8{B[0]}};
assign pp1 = A & {8{B[1]}};
assign pp2 = A & {8{B[2]}};
assign pp3 = A & {8{B[3]}};

//column 0
assign P[0] = pp0[0];
//column 1
assign P[1] = pp0[1] | pp1[0] ;
//column 2
assign P[2] = pp0[2] | pp1[1] | pp2[0];
//column 3
assign P[3] = pp0[3] | pp1[2] | pp2[1] | pp3[0];
//column 4
wire C4_1,S4_1,C4_2;
Full_Adder FA1(.a(pp0[4]),.b(pp1[3]),.Cin(pp2[2]),.Cout(C4_1),.sum(S4_1));
Full_Adder FA2(.a(pp3[1]),.b(C4_1),.Cin(S4_1),.Cout(C4_2),.sum(P[4]));
//column 5
wire C5_1,C5_2,S5_1,S5_2,C5_3;
Full_Adder FA3(.a(pp0[5]),.b(pp1[4]),.Cin(pp2[3]),.sum(S5_1),.Cout(C5_1));
Full_Adder FA4(.a(C4_2),.b(pp3[2]),.Cin(C5_1),.sum(S5_2),.Cout(C5_2));
Full_Adder FA5(.a(S5_2),.b(S5_1),.Cin(C5_2),.sum(P[5]),.Cout(C5_3));
//column 6
Full_Adder FA6(.a(pp0[6]),.b(),.Cin(),.sum());
Full_Adder FA7(.a(),.b(),.Cin(),.sum());
Full_Adder FA8(.a(),.b(),.Cin(),.sum());
Full_Adder FA9(.a(),.b(),.Cin(),.sum());
Full_Adder FA10(.a(),.b(),.Cin(),.sum());
Full_Adder FA11(.a(),.b(),.Cin(),.sum());
Full_Adder FA12(.a(),.b(),.Cin(),.sum());
Full_Adder FA13(.a(),.b(),.Cin(),.sum());
Full_Adder FA14(.a(),.b(),.Cin(),.sum());
endmodule
