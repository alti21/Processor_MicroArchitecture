`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2017 06:49:18 PM
// Design Name: 
// Module Name: divider
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


module divider(R, X, divisor,
 s2, clk, rst, sl, sr, ld, leftin, rightin, equal, greater, smaller, m2out, 
Data, Qout, LD, UD, CE, CLK, RST, s3,s4, m3out);
parameter width = 4;
parameter datain_width = 8;
wire [datain_width - 1:0] A;
wire [datain_width - 1:0] B;
input clk, rst, sl, sr, ld, leftin, rightin;
//input[width-1:0] d;
wire [2:0] in1, in2;
input s2, s3, s4;
output reg [2:0] m2out;
output reg [2:0] m3out;
//wire [2:0] mout;
output reg equal;
output reg greater;
output reg smaller;
wire [width-1:0] q1;
wire [width-1:0] q2;
wire [width-1:0] q3;
wire [3:0] diff;
wire borrow ;
wire [3:0] asub ;
wire [3:0] bsub ;
input [3:0] Data;
input LD, UD, CE, CLK, RST;
output reg [3:0] Qout;
input [4:0] R;
assign R[4:0] = {R[3:0], X[3]};
input [3:0] X;
assign X[3:0] = {X[2:0], 0};
input [3:0] divisor;
shift_reg1 #(.Data_width(5)) shift1(.CLK(clk), .RST(rst), .SL(1), .SR(sr), .LD(1), .LeftIn(leftin), .RightIn(rightin), .D(R), .Q(q1));//remainder
shift_reg1 #(.Data_width(4)) shift2(.CLK(clk), .RST(rst), .SL(1), .SR(sr), .LD(1), .LeftIn(leftin), .RightIn(rightin), .D(X), .Q(q2));//dividend
shift_reg1 #(.Data_width(4)) shift3(.CLK(clk), .RST(rst), .SL(sl), .SR(sr), .LD(1), .LeftIn(leftin), .RightIn(rightin), .D(divisor), .Q(q3));//divisor

counter (.D(Data), .LD(LD), .UD(UD), .CE(CE), .CLK(CLK), .RST(RST), .Q(Qout));
comparator #(.datain_width(datain_width)) compare(.A(q1), .B(q3), .equal(equal), .greater(greater), .smaller(smaller));
MUX mux1(.in1(diff), .in2(4'b0000), .s2(s2), .m2out(R));
MUX mux2(.in1(q1), .in2(4'b0000), .s2(s3), .m2out(m2out));
MUX mux3(.in1(q2), .in2(4'b0000), .s2(s4), .m2out(m2out));
subtractor sub(.a(q1) ,.b(q3) ,.diff(diff) ,.borrow(borrow));
endmodule
