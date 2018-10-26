module mux2 #(parameter WIDTH = 4)(
	input [WIDTH-1:0] in2, in1,
	input sel,
	output [WIDTH-1:0] out);
	
	assign out = sel? in2:in1;
endmodule