module CU_tb;
	reg Counter_Out, R_lt_Y, GO, ZeroDivisor, clk, rst;
	wire ERROR, DONE, CTE, LD, RST, xRightIn, SL, LDR, SR, r2MuxSel, r1MuxSel;
	wire [3:0] Counter;

	CU DUT0(Counter_Out, R_lt_Y, GO, ZeroDivisor, clk, rst, ERROR, DONE, CTE, LD, RST, xRightIn, SL, LDR, SR, r2MuxSel, r1MuxSel, Counter);

	reg [14:0] control;

	always @(*) control = {ERROR, DONE, LD, RST, xRightIn, SL, LDR, SR, r2MuxSel, r1MuxSel, Counter, CTE};
	task OneClk; 
		begin 
			#5 clk = 1; 
			#5 clk = 0; 
		end 
	endtask

	parameter
		error =   15'b1_0_0_1_0_0_0_0_0_0_0000_0,
		IDLE =    15'b0_0_0_1_0_0_0_0_0_0_0000_0,
		s1 =      15'b0_0_1_0_0_0_1_0_0_0_0100_1,
		s2 =      15'b0_0_0_0_0_1_0_0_0_0_0000_0,
		s3plus =  15'b0_0_0_0_0_0_1_0_1_0_0000_1,
		s3 =      15'b0_0_0_0_0_0_0_0_0_0_0000_1,
		s4 =      15'b0_0_0_0_1_1_0_0_0_0_0000_0,
		s5 =      15'b0_0_0_0_0_1_0_0_0_0_0000_0,
		s6 =      15'b0_0_0_0_0_0_0_1_0_0_0000_0,
		s7 =      15'b0_1_0_0_0_0_0_0_0_1_0000_0;

	initial begin
		// Test S0 idle first

		
		rst = 0;				//check reset
		OneClk;
		rst = 1;
		GO = 0;
		ZeroDivisor = 0;
		OneClk;
		if(control != IDLE) begin
			$display("ERROR at S0");

		end
		
		rst = 0;				//check GO
		GO = 0;
		ZeroDivisor = 1;
		OneClk;
		if(control != error) begin
			$display("ERROR at S0, expect ERROR");

		end
		
		GO = 1;					//check error flag for div
		ZeroDivisor = 1;
		OneClk;
		if(control != error) begin
			$display("ERROR at S0");

		end
		
		
		GO = 1;  						//start
		ZeroDivisor = 0;
		OneClk;
		if(control != s1) begin
			$display("ERROR at S1");

		end
		GO = 0;
		OneClk;
		$display ("Check point at s2 with control = %b and s2= %b", control, s2);
		if(control != s2) begin
			$display("ERROR at S2");
	
		end
		
		R_lt_Y = 1;
		//Counter_Out = 0;
		OneClk;
		if(control != s3) begin
			$display("ERROR at S3 with control = %b and s3 = %b", control, s3);

		end
		
		OneClk;
		if(control != s5) begin
			$display("ERROR at S5");

		end
		
		// Now the left branch    take this part out and re-test it. 
		
		Counter_Out = 1;
		OneClk;
		if(control != s6) begin
			$display("ERROR at S6 with control = %b and s6 = %b", control, s6);

		end
		OneClk;
		if(control != s7) begin
			$display("ERROR at S7 with control = %b and s7 = %b", control, s7);
		end
		GO = 0;
		ZeroDivisor = 0;
		OneClk;
		if(control != IDLE) begin
			$display("ERROR at S0, expect IDLE with control = %b and s0 = %b", control, IDLE);

		end
		
		
		//finish one, check the other way
		rst = 1; 
		OneClk;
		rst =0; 
		OneClk;
		
		GO = 1;
		ZeroDivisor = 0;
		OneClk;		//to s1
		GO = 0;
		OneClk;		//to s2
		R_lt_Y = 0;
		OneClk;
		if(control != s3plus) begin
			$display("ERROR at S3 left");

		end
		OneClk;
		if(control != s4) begin
			$display("ERROR at S4");

		end
		Counter_Out = 1;
		OneClk;
		OneClk;
		OneClk;
		if(control != IDLE) begin
			$display("ERROR at S0, expect IDLE");

		end
		
		$display("Test completed");
	end
endmodule