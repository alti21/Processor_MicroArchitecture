`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2017 11:37:54 AM
// Design Name: 
// Module Name: shifterotator
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


module 
shifterotator (Ctrl, D_in, D_out);
input [3:0] D_in;
input [2:0] Ctrl;

output reg [3:0] D_out;
reg I;
always @ (Ctrl, D_in)
    begin
        case (Ctrl)
                3'b000: D_out = D_in;
                3'b001: D_out = D_in >> 1;
                3'b010: D_out = D_in >> 2;
                3'b011: D_out = D_in >> 3;
                3'b100: D_out = D_in >> 4;
                3'b101:
                    begin
                        
                        D_out = {D_in[0], D_in[3:1]};//+ d_in[0]0
                    end
               3'b110: 
                    begin
                        //I = D_in [3];//1011-->0111
                        D_out = {D_in[1:0], D_in[3:2]};//0011+
                    end
                3'b111:
                    begin
                     //   I = D_in [0];
                        D_out = {D_in[2:0], D_in[3]};
                    end
                default: D_out = 4'bz;
            endcase
end
endmodule
