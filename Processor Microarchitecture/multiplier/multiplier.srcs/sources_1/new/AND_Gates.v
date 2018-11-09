`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2017 11:31:19 AM
// Design Name: 
// Module Name: AND_Gates
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


module AND_Gates(A,B,and_out);
    input [3:0]A;
    input [3:0]B;
    output [3:0] and_out;
    assign and_out[0] = A & B[0];
    assign and_out[1] = A & B[1];
    assign and_out[2] = A & B[2];
    assign and_out[3] = A & B[3];
endmodule
