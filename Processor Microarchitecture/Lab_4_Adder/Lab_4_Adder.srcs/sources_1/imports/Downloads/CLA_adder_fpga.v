`timescale 1ns / 1ps

//Top Level module
module CLA_adder_fpga(input clk100MHz, rst, 
                        input CarryIn0, input [3:0]A, [3:0]B,
                        output CarryIn0_LED, output [3:0] A_LED, [3:0] B_LED, //display input LEDs
                        //output carry_out, [3:0] sum,
                        output [7:0] LEDSEL, [7:0] LEDOUT); //display sum on 7seg
supply1 [7:0] vcc;
wire DONT_USE, clk_5KHz;
wire [7:0] tens, ones;
wire [3:0] sum;
wire carry_out;

///*************************************//

CLA_adder DUT (CarryIn0,A,B,carry_out,sum);//input CarryIn0, input [3:0]A, input [3:0]B, output reg carry_out, output reg [3:0] Sum 

//*****************************************//

clk_gen CLK (clk100MHz, rst, DONT_USE, clk_5KHz);
bcd_to_7seg BCD (carry_out,sum, tens, ones);

led_mux LED_ones (clk_5KHz, rst,
             vcc, vcc, vcc, vcc, vcc,vcc, tens, ones, //activelow so vcc
             LEDSEL, LEDOUT);
assign CarryIn0_LED=CarryIn0;
assign A_LED=A;
assign B_LED=B;

endmodule
