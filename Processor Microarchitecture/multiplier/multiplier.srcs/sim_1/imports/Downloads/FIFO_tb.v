`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 07:20:08 PM
// Design Name: 
// Module Name: FIFO_tb
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


module FIFO_tb();

reg clk_tb, rst_tb; //Synchronous clock. Asynchronous reset.
reg WnR_tb;  //Write(1) or Read(0) Control 
reg en_tb; //Enables the FIFO to read or write
reg [bus_width-1:0]in_tb; //Data input output to the FIFO
wire [bus_width-1:0]out_tb;  //Data output from the FIFO
wire empty_tb, full_tb;  //Flag asserted when FIFO empty or full

integer i;

FIFO( .In(in_tb), .Out(out_tb), .Empty(empty_tb), .Full(full_tb), .CLK(clk_tb), .RST(rst_tb), .WNR(WnR_tb), .EN(en_tb));

initial 
begin
clk_tb=0;
rst_tb=0;
en_tb=0;

WnR=1;
for(i=0; i<depth_width; i=i+1)
begin

end

end//end initial

always #5 clk_tb<=~clk_tb;
always #10 en_tb<=~en_tb;

endmodule
