`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2017 05:35:07 PM
// Design Name: 
// Module Name: comparator
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

module comparator(A, B, equal, greater, smaller);

parameter datain_width = 8;
input [datain_width - 1:0] A;
input [datain_width - 1:0] B;
output reg equal;
output reg greater;

output reg smaller;

always @ (A or B)
begin	
equal	<= 1'b0;
greater	<= 1'b0;
smaller	<= 1'b0;
if (A > B)
greater <= 1'b1;
else if (A < B)
smaller <= 1'b1;
else
equal <= 1'b1;
end
endmodule

