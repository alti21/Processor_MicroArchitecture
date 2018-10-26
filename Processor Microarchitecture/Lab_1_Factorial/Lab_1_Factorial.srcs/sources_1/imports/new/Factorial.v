`timescale 1ns / 1ps

module Factorial(CLK, Go, n, Product_out, CS, Done
    );
    parameter datain_width=4;
    parameter dataout_width=32;
    input CLK,Go;
    input [datain_width-1:0] n;
    output [dataout_width-1:0] Product_out;
    output [2:0]CS;
    output Done;
    wire ld_CNT, en_CNT, s_in, ld_Product, s_out, GT;
    
    
    factorial_DP DP(CLK, n, ld_CNT, en_CNT, s_in, ld_Product, s_out, Product_out, GT );
    factorial_CU CU(  CLK, Go, GT, CS,  ld_CNT, en_CNT, s_in, ld_Product, s_out, Done);
                
endmodule
