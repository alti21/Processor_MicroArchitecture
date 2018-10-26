`timescale 1ns / 1ps

module FIFO( In, Out, Empty, Full, CLK, RST, WNR, EN);

parameter bus_width=4;
parameter addr_width=3;
parameter fifo_depth=8; //2^addr_width=fifo_depth

input CLK, RST; //Synchronous clock. Asynchronous reset.
input WNR;  //Write(1) or Read(0) Control 
input EN; //Enables the FIFO to read or write
input [bus_width-1:0]In; //Data input output to the FIFO
output reg [bus_width-1:0]Out;  //Data output from the FIFO
output reg Empty, Full;  //Flag asserted when FIFO empty or full

reg [addr_width-1:0] r_ptr, w_ptr; //read and write pointers

reg [bus_width-1:0] mem [fifo_depth-1:0];   //memory used by the FIFO

always@(posedge CLK, RST)
begin
    if(RST)
        begin
        r_ptr=0;
        w_ptr=0;
        Out=0;
        end
    else if(!EN)    //nop WNR=X EN=0
        begin
        if(!WNR && !Empty) //read WNR=0 EN=1
            begin
            Out=mem[r_ptr[addr_width-1:0]];
            r_ptr=r_ptr+1;
            end
        else if(WNR && !Full) //write WNR=1 EN=1
            begin
            mem[w_ptr[addr_width-1:0]]=In;
            w_ptr=w_ptr+1;
            end 
        end
    else
        Out='bz;
        
    //update flags based on the read and write pointers
    if(r_ptr==w_ptr)
        begin
        Empty=1;
        Full=0;
        end
    else if(r_ptr[addr_width-1:0]==w_ptr[addr_width-1:0])
        begin
        Empty=0;
        Full=1;
        end
    else
        begin
        Empty=0;
        Full=0;
        end
        
end//end always

endmodule
