`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2017 11:18:54 AM
// Design Name: 
// Module Name: top_level
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


module top_level(input clk100MHz, rst, input [3:0] A, [3:0] B, [4:0] Cin, Czero, output [3:0] sum, Cout, [7:0] LEDSEL, [7:0] LEDOUT);
    supply1 [7:0] vcc;
    wire DONT_USE;
    wire clk_5KHz;
    wire [7:0] tens, ones;
    wire [3:0] P;//half adder sum
    wire [3:0] G;//half adder carry out
    half_adders(A, B, P, G);
    CLA(A, B, P, G, Cin, Czero, sum, Cout);
    wire [3:0] C;
    XOR(P, C, sum);
    clk_gen CLK (clk100MHz, rst, DONT_USE, clk_5KHz);
    bcd_to_7seg BCD (Cout, sum, tens, ones);
    led_mux LED_ones (clk_5KHz, rst, vcc, vcc, vcc, vcc, vcc,vcc, tens, ones, LEDSEL, LEDOUT);//activelow so vcc
    
endmodule
