`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2017 10:55:23 AM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb(R, X, divisor,
 s2, clk, rst, sl, sr, ld, leftin, rightin, equal, greater, smaller, m2out, 
Data, Qout, LD, UD, CE, CLK, RST, s3,s4, m3out);
reg clk, rst, sl, sr, ld, leftin, rightin, s2,UD, CE;
wire equal, greater, smaller
wire[2:0] m2out;//remainder output
reg [3:0] Data;
wire [3:0] Qout;
reg [4:0] R;
reg [3:0] X;
reg [3:0] divisor;
wire [2:0] m3out;//divident output
divider(.R(R), .X(X), .divisor(divisor),
 .s2(s2), .clk(clk), .rst(rst), .sl(sl), .sr(sr), .ld(ld), .leftin(leftin), .rightin(rightin), .equal(equal), .greater(greater), .smaller(smaller), .m2out(m2out), 
.Data(data), .Qout(Quot), .LD(LD), .UD(UD), .CE(CE), .CLK(CLK), .RST(RST), .s3(s3), .s4(s4));
initial begin
    clk=0;
    rst=1;
    s2=0;//initially, remainder is 0
    #5
    clk = ~clk; 
    rst=0;
   // for(X=0; X < 8; X = X+1) begin 
        
    
endmodule
