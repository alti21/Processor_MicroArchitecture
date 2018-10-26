`timescale 1ns / 1ps
module CNT_down(CLK, in, ld_CNT, en_CNT, out );

parameter data_width=4;
input CLK, ld_CNT, en_CNT;
input [data_width-1:0] in;
output reg [data_width-1:0] out;

always@(posedge CLK)
begin
    if(en_CNT)
    begin
        if(ld_CNT)
        out=in;
        else
        out=out-1;
    end
end

endmodule
