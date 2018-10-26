`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2017 08:04:47 PM
// Design Name: 
// Module Name: Rotaotor
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


module top_level 
(input [3:0] D_in, [2:0] Ctrl, output [3:0] D_out);//[3:0] D_in, output [3:0] D_out);
   // supply1 [7:0] vcc; 
   // wire          DONT_USE, clk_5KHz;
   // wire [3:0]    D_in;//input wire of 4 bits
   // wire [3:0]    D_out;//output wire of 4 bits 
    //wire [2:0]    Ctrl;//control wire of 2 bits
  //  wire [3:0]    i;
   // wire [7:0]    in;
    
    shifterotator SR (Ctrl, D_in, D_out);
  //  clk_gen       CLK (clk100MHz, rst, DONT_USE, clk_5KHz);
 //   bcd_to_7seg BCD (D_out, in); 
    
  //  led_mux     LED (clk_5KHz, rst, vcc, vcc, vcc, vcc, vcc, vcc, vcc, in, LEDSEL, LEDOUT); 
endmodule
