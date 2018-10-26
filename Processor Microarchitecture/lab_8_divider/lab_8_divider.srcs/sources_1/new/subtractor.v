`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2017 05:44:32 PM
// Design Name: 
// Module Name: subtractor
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


module subtractor ( a ,b ,diff ,borrow );

output [3:0] diff ;
output borrow ;

input [3:0] a ;
input [3:0] b ; 

wire [2:0]s;
wire [3:0]l;

full_adder u0 (a[0],l[0],1'b1,diff[0],s[0]);
full_adder u1 (a[1],l[1],s[0],diff[1],s[1]);
full_adder u2 (a[2],l[2],s[1],diff[2],s[2]);
full_adder u3 (a[3],l[3],s[2],diff[3],borrow);

endmodule

