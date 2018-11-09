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


module multiplier(input [3:0]mA,input [3:0]mB,input clock,input enb, input rst, output[7:0]product);
parameter width=4;
reg [7:0] PP0, PP1, PP2, PP3;
reg [7:0] PP0_1, PP2_3;
wire co0_1, co2_3; 
wire [3:0] sum0_1, sum2_3; 
reg P_1st,P_2nd;
wire ci_P,co_P;
wire [3:0] temp0,temp1,temp2,temp3;
wire [3:0] A;
wire [3:0] B;
wire [3:0] lastCLAinput1;
wire [3:0] lastCLAinput2;
wire [7:0] CLAproduct;
registerA #(width==4)one(.clk(clock), .reset(rst),.en(enb), .d(mA[width-1:0]), .q(A[width-1:0]));
registerA #(width==4)two(.clk(clock), .reset(rst),.en(enb), .d(mB[width-1:0]), .q(B[width-1:0]));
always@(A,B)
begin
 PP0= {4'b0000, temp0};
 PP1= {3'b000, temp1 , 1'b0};
 PP2= {2'b00, temp2 , 2'b00};
 PP3= {1'b0, temp3 , 3'b000};
 PP0_1 = {2'b00, co0_1, lastCLAinput1, PP0[0]};
 PP2_3 = {co2_3, lastCLAinput2, PP2[2],2'b00};
end 
and_AB AB0(A,B[0], temp0);
and_AB AB1(A,B[1], temp1);
and_AB AB2(A,B[2], temp2);
and_AB AB3(A,B[3], temp3);
CLA_adder PP01(.CarryIn0(0), .A(PP0[4:1]),.B(PP1[4:1]),.carry_out(co0_1), .Sum(sum0_1));
CLA_adder PP23(.CarryIn0(0), .A(PP2[6:3]),.B(PP3[6:3]),.carry_out(co2_3), .Sum(sum2_3));
registerA  #(width==4)stateone(.clk(clock), .reset(rst),.en(enb), .d(sum0_1[width-1:0]), .q(lastCLAinput1[width-1:0]));
registerA  #(width==4)statetwo(.clk(clock), .reset(rst),.en(enb), .d(sum2_3[width-1:0]), .q(lastCLAinput2[width-1:0]));
CLA_adder P_03(.CarryIn0(0), .A(PP0_1[3:0]),.B(PP2_3[3:0]),.carry_out(ci_P), .Sum(CLAproduct[3:0]));
CLA_adder P_47(.CarryIn0(ci_P), .A(PP0_1[7:4]),.B(PP2_3[7:4]),.carry_out(co_P), .Sum(CLAproduct[7:4]));
registerA  #(width==8) final_output(.clk(clock), .reset(rst),.en(enb), .d(CLAproduct[width-1:0]), .q(product[width-1:0]));
//Eight_bit_rgstr final_output(.clok(clock), .resetbits(rst), .data(CLAproduct[7:0]), .out(product[7:0]));
endmodule
