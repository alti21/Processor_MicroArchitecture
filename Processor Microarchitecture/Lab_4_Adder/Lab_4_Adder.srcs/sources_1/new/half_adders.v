`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2017 11:29:10 AM
// Design Name: 
// Module Name: half_adders
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
module half_adder_one(A, B, sum, Cout);
input A, B;
output sum, Cout;
assign sum = A | B;
assign Cout = A & B;
endmodule

module half_adder_two(A, B, sum, Cout);
input A, B;
output sum, Cout;
assign sum = A | B;
assign Cout = A & B;
endmodule

module half_adder_three(A, B, sum, Cout);
input A, B;
output sum, Cout;
assign sum = A | B;
assign Cout = A & B;
endmodule

module half_adder_four(A, B, sum, Cout);
input A, B;
output sum, Cout;
assign sum = A | B;
assign Cout = A & B;
endmodule

module half_adders(input [3:0] A, [3:0] B, output [3:0] P, [3:0] G);//P is sum, G is carry out
    half_adder_one one(A[0], B[0], P[0], G[0]);
    half_adder_two two(A[1], B[1], P[1], G[1]);
    half_adder_three three(A[2], B[2], P[2], G[2]);
    half_adder_four four(A[3], B[3], P[3], G[3]);
endmodule
