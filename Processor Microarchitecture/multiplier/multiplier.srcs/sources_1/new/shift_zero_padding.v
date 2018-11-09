`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2017 11:46:07 AM
// Design Name: 
// Module Name: shift_zero_padding
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


module shift_zero_padding(A,B,PP0,PP1,PP2,PP3);
    
    input [3:0]A;
    input [3:0]B;
    output[7:0] PP0;
    output[7:0] PP1;
    output[7:0] PP2;
    output[7:0] PP3;
    wire [3:0] and_out;
    assign and_out[0] = A & B[0];
    assign and_out[1] = A & B[1];
    assign and_out[2] = A & B[2];
    assign and_out[3] = A & B[3];
    //wire [3:0] to_eight_bits;
    
  //  AND_gates and0 (.A(a),.B(b[0]),.and_out(to_eight_bits[0]));
    
    assign PP0 = {0,0,0,0,and_out[0]};
    assign PP1 = {0,0,and_out[1],0};
    assign PP2 = {0,and_out[2],0,0};
    assign PP3 = {and_out[3],0,0,0};
    
endmodule
