`timescale 1ns / 1ps

module MUL(A,B, Product);

parameter in_width=32;
parameter out_width=32;
input [in_width-1:0] A,B;
output reg [out_width-1:0] Product;

always@(*)
begin
    Product=A*B;
end//end always

endmodule
