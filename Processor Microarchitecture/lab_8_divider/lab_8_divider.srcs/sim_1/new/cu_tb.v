`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2017 01:16:18 PM
// Design Name: 
// Module Name: cu_tb
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


module cu_tb( );
reg clk_tb;
reg  Go_tb;
reg R_Y;
reg cnt;
wire [1:0] done;
wire cs, ld1, sl, sr, rst1, sel1, sel2, sel3, ud, ce, rst2, ld2, sl2, sr2, ld3, sl3, sr3, rst3, reset, ldcount, rstcount;
CU control(clk_tb, go_tb, R_Y, cnt, done, 
 ld1, sl, sr, rst1, sel1, sel2, sel3, ud, ce, rst2,
ld2, sl2, sr2, ld3, sl3, sr3, rst3, reset, ldcount, rstcount, cs);
integer count, cycle, ErrorCount;        
initial
begin
clk_tb=0;
ErrorCount=0;
Go_tb=1;
for(count=0;count<2;count=count+1)
begin
     for(cycle=0;cycle<6;cycle=cycle+1)
     begin
        if(cycle==0)begin Go_tb=1;#5; end
         else Go_tb=0;
         clk_tb=1;#5;
        
        case(cs)
            0: begin
                 if({done, 
             ld1, sl, sr, rst1, sel1, sel2, sel3, ud, ce, rst2,
            ld2, sl2, sr2, ld3, sl3, sr3, rst3, reset, ldcount, rstcount, c}!= {23'b00_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0})
endmodule
