`timescale 1ns / 1ps

module factorial_CU( input CLK, Go, GT, 
    output reg [2:0]CS, output reg ld_CNT, en_CNT, s_in, ld_Product, s_out, Done);
   reg [2:0]NS;
    parameter   S0=3'b000,
                S1=3'b001,
                S2=3'b010,
                S3=3'b011,
                S4=3'b100;
    
initial begin
CS=S0;
end

always@(posedge CLK)
 begin
     CS<=NS; 
 end
    
always@(CS,Go,GT)
begin
         case(CS)
            S0: begin
                if(Go) NS<=S1;
                else NS<=S0;
                end
            S1: begin
                NS<=S2;
                end
            S2: begin
                if(GT) NS<=S3;
                else NS<=S4;
                end
            S3: NS<=S2;
            S4: NS<=S0;
            default: NS<=S0;
        endcase
end//end always
    
always@(CS)
    begin
    case(CS)
        S0: begin
            {ld_CNT, en_CNT, s_in, ld_Product, s_out, Done}=6'b000000;
            end
        S1: begin
            {ld_CNT, en_CNT, s_in, ld_Product, s_out, Done}=6'b111100;
            end
        S2: begin
            {ld_CNT, en_CNT, s_in, ld_Product, s_out, Done}=6'b000000;
            end
        S3: begin
            {ld_CNT, en_CNT, s_in, ld_Product, s_out, Done}=6'b010100;
            end
        S4: begin
            {ld_CNT, en_CNT, s_in, ld_Product, s_out, Done}=6'b000011;
            end
        default:    begin
                {ld_CNT, en_CNT, s_in, ld_Product, s_out, Done}=6'b000000;
                end
    endcase
end//end always

endmodule
