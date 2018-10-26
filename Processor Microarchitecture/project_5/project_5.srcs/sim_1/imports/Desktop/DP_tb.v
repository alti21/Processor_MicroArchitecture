module DP_tb;
	reg [3:0] X, Y, CT;
	reg clk;
	reg LD, RST, xRightIn;
	reg SL, LDR, SR;
	reg r2MuxSel, r1MuxSel;
	reg CTE;
	reg [12:0] ctrl = 0;
	
	wire udct_out, R_lt_Y, divByZero;
	wire [3:0] quotient;
	wire [4:0] remainder;
	integer inputs = 9'b000000000;
	
	DP DUT(X, Y, CT, clk, LD, RST, xRightIn, SL, LDR, SR, r2MuxSel, r1MuxSel, CTE, udct_out, R_lt_Y, divByZero, quotient, remainder);
	
	task OneClk; 
		begin 
			#5 clk = 1; 
			#5 clk = 0; 
		end 
	endtask
	
	always @ (ctrl) {LD, RST, xRightIn, SL, LDR, SR, r2MuxSel, r1MuxSel, CT, CTE} = ctrl;	
	
	parameter
		S0 =  13'b0_1_0_0_0_0_0_0_0000_0,
		S1 =  13'b1_0_0_0_1_0_0_0_0100_1,
		S2 =  13'b0_0_0_1_0_0_0_0_0000_0,
		S30 = 13'b0_0_0_0_1_0_1_0_0000_1,
		S3 =  13'b0_0_0_0_0_0_0_0_0000_1,
		S4 =  13'b0_0_1_1_0_0_0_0_0000_0,
		S5 =  13'b0_0_0_1_0_0_0_0_0000_0,
		S6 =  13'b0_0_0_0_0_1_0_0_0000_0,
		S7 =  13'b0_0_0_0_0_0_0_1_0000_0;


	

	
	initial begin
	   RST = 0;
	   OneClk;
	   RST = 1;
	   OneClk;
	   RST = 0;
	   OneClk;
		for(inputs = 0; inputs < 256; inputs = inputs+1) begin
			{X, Y} = inputs;
			ctrl = S0;
			OneClk;
			if(divByZero == 1'b0) begin
				ctrl = S1;
				OneClk;

				ctrl = S2;
				OneClk;
				while(udct_out != 1) begin		//outct != 0000
					
					if(R_lt_Y == 0) begin    	//if a<b
						ctrl = S30;
						OneClk;
						ctrl = S4;
						OneClk;
					end
					else begin
						ctrl = S3;
						OneClk;
						ctrl = S5;
						OneClk;
					end
				end
				ctrl = S6;
				OneClk;
				ctrl = S7;
				OneClk;
				if(X != quotient*Y+remainder) begin
					$display("%d != %d x %d + %d", X, quotient, Y, remainder);
					$stop;
				end
			end
		end
		$display("Test is successfully completed");
	end
endmodule