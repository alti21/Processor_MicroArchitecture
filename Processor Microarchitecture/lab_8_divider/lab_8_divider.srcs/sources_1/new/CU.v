`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2017 08:57:25 AM
// Design Name: 
// Module Name: CU
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


module CU(input CLK, go, input  R_It_Y, cnt_out,  output reg [1:0] done, 
output reg ld1, sl, sr, rst1, sel1, sel2, sel3, ud, ce, rst2,
ld2, sl2, sr2, ld3, sl3, sr3, rst3, reset, ldcount, rstcount, cs);
reg [3:0] ns; 
//reg [3:0] cs;
parameter s0=4'b0000,
          s1=4'b0001,
          s2=4'b0010,
          s3=4'b0011,
          s4=4'b0100,
          s5=4'b0101,
          s6=4'b0110,
          s7=4'b0111,
          s8=4'b1000;
initial begin
    cs=s0;
end
always@(cs, go, R_It_Y, cnt_out)
begin
    case(cs)
        s0: begin
                if(go)ns<=s1;
                else ns<=s0;
            end
        s1: ns<=s2;
        s2: ns<=s3;
        s3: begin
                if(R_It_Y==0) ns<=s4;
                else ns<=s5;
            end
        s4: begin
                if(cnt_out==0) ns<=s3;
                else ns<=s6;
            end
        s5: begin
                if(cnt_out==0) ns<=s3;
                else ns<=s6;
            end 
        s6: ns<=s7;
        s7: ns<=s0;  
        default: ns<=s0;  
     endcase
end

always@(posedge CLK)
begin
    cs<=ns; 
end      

always@(cs)//done, output reg ld1, sl, sr, rst1, sel1, sel2, sel3, ud, ce, rst2
begin
    case(cs)
        s0: begin
                ld1=0; sl=0; sr=0; rst1=0; sel1=0; sel2=0; sel3=0; ud=0; ce=0; reset=0;//mux1 sel = 0 to load 0
                ld2=0; sl2=0; sr2=0; rst2=0;
                ld3=0; sl3=0; sr3=0; rst3=0;
                ldcount=0; rstcount=0; done=0;
            end
        s1: begin//load R, X, Y, and CNT 
                ld1=1; sl=0; sr=0; rst1=0; sel1=0; sel2=0; sel3=0; ud=0; ce=0; reset=0;
                ld2=1; sl2=0; sr2=0; rst2=0;
                ld3=1; sl3=0; sr3=0; rst3=0;
                ldcount=1; rstcount=0; done=0;
            end
        s2: begin//shift R and X
                ld1=0; sl=1; sr=0; rst1=0; sel1=0; sel2=0; sel3=0; ud=0; ce=0; reset=0;
                ld2=0; sl2=1; sr2=0; rst2=0;
                ld3=0; sl3=0; sr3=0; rst3=0;
                ldcount=0; rstcount=0; done=0;
            end
        s3: begin//cnt - 1
                ld1=0; sl=0; sr=0; rst1=0; sel1=0; sel2=0; sel3=0; ud=0; ce=1; reset=0;
                ld2=0; sl2=0; sr2=0; rst2=0;
                ld3=0; sl3=0; sr3=0; rst3=0;
                ldcount=0; rstcount=0; done=0;
             end
         s4: begin//
                ld1=0; sl=1; sr=0; rst1=0; sel1=0; sel2=0; sel3=0; ud=0; ce=0; reset=0;
                 ld2=0; sl2=1; sr2=0; rst2=0;
                 ld3=0; sl3=0; sr3=0; rst3=0;
                 ldcount=0; rstcount=0;  done=0; 
              end
         s5: begin
              ld1=0; sl=1; sr=0; rst1=0; sel1=0; sel2=0; sel3=0; ud=0; ce=0; reset=0;
                ld2=0; sl2=1; sr2=0; rst2=0;
                ld3=0; sl3=0; sr3=0; rst3=0;
             ldcount=0; rstcount=0; done=0;
             end
         s6: begin
                 ld1=0; sl=1; sr=0; rst1=0; sel1=0; sel2=0; sel3=0; ud=0; ce=0; reset=0;
                        ld2=0; sl2=0; sr2=0; rst2=0;
                        ld3=0; sl3=0; sr3=0; rst3=0;
                     ldcount=0; rstcount=0; done=0;
             end
         s7: begin
         ld1=0; sl=0; sr=0; rst1=0; sel1=0; sel2=0; sel3=0; ud=0; ce=0; reset=0;
                                 ld2=0; sl2=0; sr2=0; rst2=0;
                                 ld3=0; sl3=0; sr3=0; rst3=0;
                              ldcount=0; rstcount=0;
                done=1;
             end
    endcase
    end
endmodule
