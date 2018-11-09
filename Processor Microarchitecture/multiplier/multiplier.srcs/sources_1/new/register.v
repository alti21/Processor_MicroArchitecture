`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2017 12:57:03 PM
// Design Name: 
// Module Name: registerA
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


module registerA(input clk, input reset, input[3:0]d, output reg [3:0] q);
    always@(posedge clk)
        if(reset) q <= 4'b0;
        else q <= d;
endmodule
