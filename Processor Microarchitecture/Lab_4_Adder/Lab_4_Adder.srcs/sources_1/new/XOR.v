`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2017 03:05:38 PM
// Design Name: 
// Module Name: XOR
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


module XOR(P, C, sum);
    input [3:0] P;
    input [3:0] C;
    output [3:0] sum;
    assign sum[0] = P[0]^C[0];
    assign sum[1] = P[1]^C[1];
    assign sum[2] = P[2]^C[2];
    assign sum[3] = P[3]^C[3];
endmodule
