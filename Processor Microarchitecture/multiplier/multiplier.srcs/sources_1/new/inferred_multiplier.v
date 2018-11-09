`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2017 07:08:32 PM
// Design Name: 
// Module Name: inferred_multiplier
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


module inferred_multiplier(aref,bref,pref);
input [3:0] aref;
input [3:0] bref;
output [7:0] pref;
assign pref = aref*bref;
endmodule
