`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2017 05:39:08 PM
// Design Name: 
// Module Name: MUX
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

module MUX (in1, in2, s2, m2out);
input [2:0] in1, in2;
input s2;
output reg [2:0] m2out;

always @ (in1, in2, s2)
begin
if (s2)
	m2out = in1;
else
	m2out = in2;
end

endmodule //MUX2
