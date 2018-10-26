`timescale 1ns / 1ps

module factorial_DP(CLK, n, ld_CNT, en_CNT, s_in, ld_Product, s_out, Product_out, GT );

parameter datain_width=4,
          dataout_width=32;

input [datain_width-1:0] n;
input CLK, ld_CNT, en_CNT, s_in, ld_Product, s_out;
output [dataout_width-1:0] Product_out;
output GT;
wire [dataout_width-1:0] Product;
wire [dataout_width-1:0] P_Q, m_out;
wire [datain_width-1:0] CNT_out;

CNT_down #datain_width CNT(CLK, n, ld_CNT, en_CNT, CNT_out);
CMP #datain_width CMP_AB(.A(CNT_out), .B(1), .GT(GT) ); //check if CNT_out>1
MUL #dataout_width Mult({28'd0,CNT_out}, P_Q, Product);
mux2to1 #dataout_width in_MUX(1, Product, s_in, m_out);
REG #dataout_width Product_reg(m_out, ld_Product, P_Q, CLK );
mux2to1 #dataout_width out_MUX(Product, 0, s_out, Product_out);


endmodule
