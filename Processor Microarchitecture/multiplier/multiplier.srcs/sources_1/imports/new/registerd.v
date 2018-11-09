`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2017 12:57:03 PM
// Design Name: 
// Module Name: registerA
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


module registerd (input clok, input resetbits, input enl, input[3:0]data, output reg [3:0] out);
    always@(posedge clok, posedge resetbits)
        if(resetbits) out <= 4'b0;
        else if (enl)    out <=data; 
        else out <= out;
endmodule
