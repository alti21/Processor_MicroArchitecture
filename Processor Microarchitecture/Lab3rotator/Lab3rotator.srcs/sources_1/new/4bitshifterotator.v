`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2017 12:32:37 PM
// Design Name: 
// Module Name: 4bitshifterotator
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


module shifterotator(Ctrl, D_in, D_out);
input [2:0] Ctrl;
input [3:0] D_in;
output reg [3:0] D_out;
reg I;
always @ (Ctrl,D_in)
begin
    case (Ctrl)
        3'b000:     D_out = D_in;//the 3 bit numbers in each line here correspond to Ctrl signal!!!!!
        3'b001:     D_out = D_in >> 1;
        3'b010:     D_out = D_in >> 2;
        3'b011:     D_out = D_in >> 3;
        3'b100:     D_out = D_in >> 4;
        3'b101:     begin
                        I = D_in [3];
                        D_out = (D_in >> 1) + I;
                    end
        3'b110:     begin
                        I = D_in [3];
                        D_out = (D_in >> 1) + I;
                    end
        3'b111:     begin
                        I = D_in [0];
                        D_out = (D_in >> 1) + {I, 3'b0};
                    end
        default:    D_out = 4'bz;
    endcase
end
endmodule
