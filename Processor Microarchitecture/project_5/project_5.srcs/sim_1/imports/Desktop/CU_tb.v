module CU_tb;
	reg cnt_out, R_lt_Y, GO, divByZero, clk, rst;
	wire ERROR, DONE, CECT, LOAD, RST, xRightIn, SL, LDR, SRR, r2MuxSel, r1MuxSel;
	wire [3:0] CT;

	CU DUT0(cnt_out, R_lt_Y, GO, divByZero, clk, rst, ERROR, DONE, CECT, LOAD, RST, xRightIn, SL, LDR, SRR, r2MuxSel, r1MuxSel, CT);

	reg [14:0] control;

	always @(*) control = {ERROR, DONE, LOAD, RST, xRightIn, SL, LDR, SRR, r2MuxSel, r1MuxSel, CT, CECT};
	task OneClk; 
		begin 
			#5 clk = 1; 
			#5 clk = 0; 
		end 
	endtask

	parameter
		ERROR = 15'b1_0_0_1_0_0_0_0_0_0_0000_0,
		IDLE = 15'b0_0_0_1_0_0_0_0_0_0_0000_0,
		s1 = 15'b0_0_1_0_0_0_1_0_0_0_0100_1,
		s2 = 15'b0_0_0_0_0_1_0_0_0_0_0000_0,
		s3plus = 15'b0_0_0_0_0_0_1_0_1_0_0000_1,
		s3 = 15'b0_0_0_0_0_0_0_0_0_0_0000_1,
		s4 = 15'b0_0_0_0_1_1_0_0_0_0_0000_0,
		s5 = 15'b0_0_0_0_0_1_0_0_0_0_0000_0,
		s6 = 15'b0_0_0_0_0_0_0_1_0_0_0000_0,
		s7 = 15'b0_1_0_0_0_0_0_0_0_1_0000_0;

	initial begin
		// Test S0 idle first
		rst = 0;
		OneClk;
		rst = 1;
		GO = 0;
		divByZero = 0;
		OneClk;
		if(control != IDLE) begin
			$display("ERROR at S0");
			$stop;
		end
		
		rst = 0;
		GO = 0;
		divByZero = 1;
		OneClk;
		if(control != ERROR) begin
			$display("ERROR at S0, expect ERROR");
			$stop;
		end
		
		GO = 1;
		divByZero = 1;
		OneClk;
		if(control != ERROR) begin
			$display("ERROR at S0");
			$stop;
		end
		

		GO = 1;  //start
		divByZero = 0;
		OneClk;
		if(control != s1) begin
			$display("ERROR at S1");
			$stop;
		end
		OneClk;
		if(control != s2) begin
			$display("ERROR at S2");
			$stop;
		end
		
		R_lt_Y = 1;
		cnt_out = 0;
		#5
		OneClk;
		if(control != s3) begin
			$display("ERROR at S3");
			$stop;
		end
		
		OneClk;
		if(control != s5) begin
			$display("ERROR at S5");
			$stop;
		end
		
		// Now the left branch    take this part out and re-test it. 
		R_lt_Y = 0;
		OneClk;
		if(control != s3plus) begin
			$display("ERROR at S3 left");
			$stop;
		end
		OneClk;
		if(control != s4) begin
			$display("ERROR at S4");
			$stop;
		end
		cnt_out = 1;
		OneClk;
		if(control != s6) begin
			$display("ERROR at S6");
			$stop;
		end
		OneClk;
		if(control != s7) begin
			$display("ERROR at S7");
			$stop;
		end
		GO = 0;
		divByZero = 0;
		OneClk;
		if(control != IDLE) begin
			$display("ERROR at S0, expect IDLE");
			$stop;
		end
		$display("Test successful");
	end
endmodule