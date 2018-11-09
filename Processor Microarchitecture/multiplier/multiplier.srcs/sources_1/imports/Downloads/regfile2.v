`timescale 1ns / 1ps


module regfile2( input clk, //Clock
                input we1, we2,  //write enable for write data ports 1 and 2 respectively
                input [4:0] ra1, ra2,   //read addresses for ports 1 and 2
                input [4:0] wa1, wa2, //write addresses for ports 1 and 2
                input [31:0] wd1, wd2, //write data for ports 1 and 2 respectively
                output [31:0] rd1, rd2);  //read data for ports 1 and 2
                
    reg [31:0] regfile [31:0]; //32x32 register file
    
    assign rd1 = (ra1 != 0) ? regfile[ra1] : 0;
    assign rd2 = (ra2 != 0) ? regfile[ra2] : 0;
    
    always@(posedge clk)
    begin
    if (we1) 
        regfile[wa1] <= wd1;
    if (we2) 
        regfile[wa2] <= wd2;
    end
    
endmodule
