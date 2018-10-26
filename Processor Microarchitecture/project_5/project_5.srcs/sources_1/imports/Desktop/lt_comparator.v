module lt_comparator #(parameter WIDTH = 5)(
	input [WIDTH-1:0] a,
	input [WIDTH-1:0] b,
	output lt);
	
	assign lt = (a<b)? 1:0;
endmodule