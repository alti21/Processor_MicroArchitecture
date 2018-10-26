`timescale 1ns / 1ps

module FIFO_fpga(input clk100MHz, rst, enable, Debouncer_button,
input WNR,  //Write(1) or Read(0) Control 
       input [3:0]In, //Data input output to the FIFO
       output [3:0]Out,  //Data output from the FIFO
       output Empty, Full  //Flag asserted when FIFO empty or full
       ,output enable_LED, WNR_LED
    );
     
       wire DONT_USE, clk_5KHz;
       wire Debouncer_out;
           
   FIFO DUT ( .In(In), .Out(Out), .Empty(Empty), .Full(Full), .CLK(Debouncer_out), .RST(rst), .WNR(WNR), .EN(enable));
   clk_generator autoClock(.clk100MHz( clk100MHz ), .rst( RST ), .clk_4sec( DONT_USE ), .clk_5KHz( clk_5KHz ));
       button_debouncer #8 Debouncer(.clk( clk_5KHz),                
                            .button( Debouncer_button ),              /* Input button from constraints */
                            .debounced_button( Debouncer_out ) );
    assign enable_LED=enable;
    assign WNR_LED=WNR;
endmodule
