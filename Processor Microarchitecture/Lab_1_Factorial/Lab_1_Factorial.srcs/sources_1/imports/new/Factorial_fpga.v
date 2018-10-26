`timescale 1ns / 1ps


module Factorial_fpga(input clk100MHz, rst, Debouncer_button,
        input [3:0]N, 
        input Go,  output Done, [2:0]CS,
        output [7:0] LEDSEL, [7:0] LEDOUT);

	supply1 [7:0] vcc;
    wire DONT_USE, clk_5KHz;
    wire Debouncer_out;
    wire [31:0] Product_Out;
    wire [3:0] d_ones, d_tens, d_hundreds, d_thousands, d_10k, d_100k, d_1m, d_10m;
	wire [7:0] s_ones, s_tens, s_hundreds, s_thousands, s_10k, s_100k, s_1m, s_10m;
    
         
    Factorial Fa(Debouncer_out, Go, N, Product_Out, CS, Done);
                        
	clk_gen autoClock(.clk100MHz( clk100MHz ), .rst( rst ), .clk_4sec( DONT_USE ), .clk_5KHz( clk_5KHz ));
	
	button_debouncer #8 Debouncer(.clk( clk_5KHz),                
		 .button( Debouncer_button ),              /* Input button from constraints */
		 .debounced_button( Debouncer_out ) );
     
    bin2bcd32 convert(Product_Out,
            d_ones, d_tens, d_hundreds, d_thousands, d_10k, d_100k, d_1m, d_10m);      
			
    bcd_to_7seg BCD_1s (d_ones,s_ones);
    bcd_to_7seg BCD_10s (d_tens, s_tens);
    bcd_to_7seg BCD_100s (d_hundreds,s_hundreds);
    bcd_to_7seg BCD_1k (d_thousands, s_thousands);
    bcd_to_7seg BCD_10k (d_10k, s_10k);
	bcd_to_7seg BCD_100k (d_100k, s_100k);
    bcd_to_7seg BCD_1m (d_1m, s_1m);
    bcd_to_7seg BCD_10m (d_10m, s_10m);
    
            
	led_mux LED_mux (clk_5KHz, rst,
		  s_10m, s_1m, s_100k, s_10k, s_thousands, s_hundreds, s_tens, s_ones, //activelow so vcc
		  LEDSEL, LEDOUT);  
                           
endmodule
