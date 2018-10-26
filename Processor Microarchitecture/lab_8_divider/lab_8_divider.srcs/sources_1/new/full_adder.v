`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2017 05:43:17 PM
// Design Name: 
// Module Name: full_adder
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

module full_adder (sum, c_out, a, b, c_in);

input a, b, c_in;
output c_out, sum;
wire w1, w2, w3;

Add_half M1 (.a(a), .b(b), .sum(w1), .c_out(w2));
Add_half M2 (.a(c_in), .b(w1), .sum(sum), .c_out(w3));

assign c_out = w2|w3;

endmodule

