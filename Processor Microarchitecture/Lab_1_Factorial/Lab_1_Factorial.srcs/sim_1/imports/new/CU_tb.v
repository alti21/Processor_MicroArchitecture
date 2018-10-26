`timescale 1ns / 1ps


module CU_tb(    );

reg CLK, Go, GT;
wire [2:0]CS;
wire ld_CNT, en_CNT, s_in, ld_Product, s_out, Done;

factorial_CU DUT_CU(  CLK, Go, GT, CS, ld_CNT, en_CNT, s_in, ld_Product, s_out, Done);


initial 
    begin
    CLK=0;
//    ErrorCount=0;
    Go=0;
    
    CLK=1; #5; CLK=0; #5;

    Go=1;
CLK=1; #5; CLK=0; #5;
Go=0;
CLK=1; #5; CLK=0; #5;
end
endmodule
