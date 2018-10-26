`timescale 1ns / 1ps

module FIFO_tb();

reg clk_tb, rst_tb; //Synchronous clock. Asynchronous reset.
reg WnR_tb;  //Write(1) or Read(0) Control 
reg en_tb; //Enables the FIFO to read or write
reg [3:0]in_tb; //Data input output to the FIFO
wire [3:0]out_tb;  //Data output from the FIFO
wire empty_tb, full_tb;  //Flag asserted when FIFO empty or full
integer i;

FIFO DUT( .In(in_tb), .Out(out_tb), .Empty(empty_tb), .Full(full_tb),
         .CLK(clk_tb), .RST(rst_tb), .WNR(WnR_tb), .EN(en_tb));

initial 
begin
clk_tb=0;
en_tb=1;
rst_tb=1;#5;
rst_tb=0;


$display("------Nothing was written at this time------");
CheckFIFO(empty_tb,full_tb);
WnR_tb=1;
for(i=0; i<8; i=i+1)//depth of 8
begin
in_tb=i+5;#40;
if(i==5)
    begin
    $display("------Inputs were written to the FIFO------");
    CheckFIFO(empty_tb,full_tb);
    end
end
$display("------After write for-loop is done------");
CheckFIFO(empty_tb,full_tb);

en_tb=1;
$display("------Nothing was read at this time------");
CheckFIFO(empty_tb,full_tb);
WnR_tb=0;
for(i=0; i<8; i=i+1)//depth of 8
begin
#40;
if(i==5)
    begin
    $display("------The FIFO was read------");
    CheckFIFO(empty_tb,full_tb);
    end
end
$display("------After read for-loop is done------");
CheckFIFO(empty_tb,full_tb);
en_tb=0;
end//end initial

always #20 clk_tb<=~clk_tb;
//always #10 en_tb<=~en_tb;



task CheckFIFO(input empty, input full);
//input empty;
//input full;
begin
if(empty && !full)
    $display("FIFO is empty");
else if(full && !empty)
    $display("FIFO is full");
else 
    $display("FIFO is partially empty or partially full");
end
endtask
endmodule
