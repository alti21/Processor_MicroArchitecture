`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2017 06:51:59 PM
// Design Name: 
// Module Name: counter
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


module counter (D, LD, UD, CE, CLK, RST_, Q); 
input [3:0] D;
input LD, UD, CE, CLK, RST_;

output reg [3:0] Q;

always @ (posedge CLK, negedge RST_)
begin
if (!RST_) Q = 4'b0;

else if (CE)
begin
if (LD) Q = D;
else if (UD) Q = Q + 4'b0001;
else Q = Q - 4'b0001;
end
else Q = Q;
end

endmodule

