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


module multiplier(A,B,PP1,PP2,PP3,product);
    
    input [3:0]A;
    input [3:0]B;
    wire[7:0] PP0;
    wire[7:0] PP1;
    wire[7:0] PP2;
    wire[7:0] PP3;
    wire[3:0] CLA1out;
    wire[3:0] CLA2out;
    output[7:0] product;
    wire [3:0] and_out;
    wire Cout;
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
    
    //assign product = PP0 + PP1 + PP2 + PP3;
    
    CLA_adder CLA1(.CarryIn0(1'b0),.A([3:0]PP0),.B([3:0]PP1),.carry_out(Cout),.Sum(CLA1out));
    CLA_adder CLA1o5(.CarryIn0(.carry_out(Cout)),.A([7:4]PP0),.B([7:4]PP1),.carry_out(Cout),.Sum(CLA2out));//make cout from 3:0 the cin for 7:4
    
endmodule
