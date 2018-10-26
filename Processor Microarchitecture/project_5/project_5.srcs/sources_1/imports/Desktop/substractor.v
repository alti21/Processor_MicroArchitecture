module subtractor #(parameter WIDTH = 5)(
	input [WIDTH-1:0] a, b,
	output [WIDTH-1:0] c);
	
	assign c = a-b;
endmodule

