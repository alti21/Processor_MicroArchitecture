`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2017 12:58:37 PM
// Design Name: 
// Module Name: top_level_for_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_level_for_multiplier(input clk100MHz, rst, [3:0]A, [3:0]B,  output [7:0]product, [7:0]LEDSEL, [7:0]LEDOUT);
    supply1 [7:0] vcc; 
    wire DONT_USE, clk_5KHz;
    wire [3:0] vote;
    wire [3:0]    i; 
    parameter depth = 16;
    multiplier m(A,B, clk100MHz,rst,product);
    button_debouncer debouce (depth);
    clk_gen CLK (clk100MHz, rst, DONT_USE, clk_5KHz); 
    bcd_to_7seg BCD (i, vote); 
    led_mux     LED (clk_5KHz, rst, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vote, LEDSEL, LEDOUT);
   // register regs(clk, rst, A, product);
   // AND_gates and1(A, B, and_output);
 //   assign PP1 = {0,0,0,0,and_output};//{0,0,0,0,and_output1] concatenate the 0's w/ and_output
endmodule
