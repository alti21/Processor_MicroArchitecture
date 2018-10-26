`timescale 1ns / 1ps


module REG(in, ld, out, clk    );
parameter data_width=4;
input [data_width-1:0] in;
input clk,ld;
output reg [data_width-1:0] out;

always@(posedge clk)
begin
    if(ld)
        out=in;
        
end
endmodule
