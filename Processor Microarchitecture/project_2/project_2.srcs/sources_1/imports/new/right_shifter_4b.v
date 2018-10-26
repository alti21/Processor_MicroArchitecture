`timescale 1ns / 1ps

module right_shifter_4b (input [2:0] Ctrl, input [3:0] S_in, output reg [3:0] S_out);
    
reg I;
always @ (Ctrl, S_in)
begin
    case (Ctrl)
        3'b000: S_out = S_in;//pass
        3'b001: S_out = {1'b0,S_in[3:1]};//SR1
        3'b010: S_out = {2'b00,S_in[3:2]};//SR2
        3'b011: S_out = {3'b000,S_in[3]};//SR3
        3'b100: S_out = 4'b0000;//SR4
        3'b101: S_out = {S_in[0],S_in[3:1]}; //RR1
        3'b110: S_out = {S_in[1:0],S_in[3:2]};//RR2
        3'b111: S_out = {S_in[2:0],S_in[3]}; //RR3
        default: S_out = 4'bz;
    endcase
end
endmodule
