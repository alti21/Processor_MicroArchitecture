module DP(
	input [3:0] dividend, divisor, CT,
	input clk,
	input LD, RST, xRightIn,
	input SL, LDR, SRR,
	input r2MuxSel, r1MuxSel,
	input CTE,
	output cnt_out, R_lt_Y, ZeroDivisor,
	output [3:0] quotient,
	output [4:0] remainder);
	wire [3:0] y_out, x_out;
	wire [4:0] r_out;
	wire [4:0] rsrMux_out;
	wire [4:0] subOut;
	wire [3:0] OUTCT;
	
	mux2 #5 R2MUX(subOut, 5'b00000, r2MuxSel, rsrMux_out); // 5 bit

	shifter_register #5 R(rsrMux_out, 1'b0, x_out[3], LDR, SL, SRR, RST, clk, r_out); 	// 5 bits
	shifter_register Y(divisor, 1'b0, 1'b0, LD, 1'b0, 1'b0, RST, clk, y_out);  	// 4 bits
	shifter_register X(dividend, 1'b0, xRightIn, LD, SL, 1'b0, RST, clk, x_out); 	// 4 bits
	
	lt_comparator comp(r_out, {1'b0, y_out}, R_lt_Y);
	
	subtractor sub(r_out, {1'b0, y_out}, subOut);

	mux2 #5 RMUX (r_out, 5'b00000, r1MuxSel, remainder); 	// 5 bits
	mux2 QMUX(x_out, 4'b0000, r1MuxSel, quotient); 			// 4 bits

	ud_counter udc(CT, LD, 1'b0, CTE, RST, clk, OUTCT);
	
	assign cnt_out = (OUTCT == 4'b0000)? 1:0;
	assign ZeroDivisor = (divisor == 4'b0000)? 1:0;
endmodule


