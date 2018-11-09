module bcd_to_7seg (input c_o, input [3:0] BCD, output reg [7:0] s_10s, output reg [7:0] s_1s);

reg [7:0] s;
reg[4:0] wCarryOut;
integer digit_10s;
integer digit_1s;

always @ (c_o,BCD)
begin
    wCarryOut={c_o,BCD};  //if want to include carry out in sum(5 bits)
//    wCarryOut={1'b0,BCD};   //if don't want carryout in sum(4 bits)
    digit_10s = wCarryOut/10;
    digit_1s = wCarryOut%10;
    
    case (digit_1s)//ones place
    0: s_1s = 8'b10001000; //active low outputs
    1: s_1s = 8'b11101101; //s6 s5 s4 ... s0
    2: s_1s = 8'b10100010;
    3: s_1s = 8'b10100100; //display 3 on 7-seg
    4: s_1s = 8'b11000101; //display 4 on 7-seg
    5: s_1s = 8'b10010100; //display 5 on 7-seg
    6: s_1s = 8'b10010000; //and so on...
    7: s_1s = 8'b10101101;
    8: s_1s = 8'b10000000;
    9: s_1s = 8'b10000100;
    default: s_1s = 8'b01111111;
    endcase
    case (digit_10s)//ones place
    0: s_10s= 8'b10001000; //active low outputs
    1: s_10s = 8'b11101101; //s6 s5 s4 ... s0
    2: s_10s = 8'b10100010;
    3: s_10s = 8'b10100100; //display 3 on 7-seg
    4: s_10s = 8'b11000101; //display 4 on 7-seg
    5: s_10s = 8'b10010100; //display 5 on 7-seg
    6: s_10s = 8'b10010000; //and so on...
    7: s_10s = 8'b10101101;
    8: s_10s = 8'b10000000;
    9: s_10s = 8'b10000100;
    default: s_10s = 8'b01111111;
    endcase
    
    
end
endmodule