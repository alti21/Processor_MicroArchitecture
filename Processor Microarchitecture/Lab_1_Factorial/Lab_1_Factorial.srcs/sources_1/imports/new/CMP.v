`timescale 1ns / 1ps
module CMP(A, B, GT    );
parameter data_width=4;
input wire [data_width-1:0] A,B;
output reg GT;

always@(*)
begin
   //(A>B) ? GT=1 : GT=0;
   if(A>B) GT=1;
   else GT=0;
end
endmodule
