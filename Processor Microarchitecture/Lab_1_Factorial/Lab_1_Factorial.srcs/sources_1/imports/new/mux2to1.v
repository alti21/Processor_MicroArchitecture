`timescale 1ns / 1ps

module mux2to1(in1, in0, sel, out);

parameter data_width=4;
input [data_width-1:0] in1,in0;
input sel;
output reg [data_width-1:0] out;
    
always@(*)
begin
    if(sel)out=in1;
    else out=in0;
end//end always
    
endmodule
