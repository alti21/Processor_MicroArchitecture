`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2017 06:59:21 PM
// Design Name: 
// Module Name: Eight_bit_rgstr
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


module registerA #(parameter width = 8) (input clk, input reset,input en, input[width-1:0]d, output reg [width-1:0] q);
//module Eight_bit_rgstr (input clok, input resetbits,input en, input [7:0]data, output reg [7:0] out);
always@(posedge clk, posedge reset)
if(reset) q <= 0;
else if (en)    q <=d;
else q <= q;
endmodule
