`timescale 1ns / 1ps

module inferred_adder(input carryin, input [3:0]A, input [3:0]B, output reg carry_out, output reg [3:0] sum );
integer c_o,c_i;  //carry out and in
integer i;//increment

always@(carryin,A,B)
begin
    c_o=0;
    c_i=carryin;
    
    {c_o,sum}=A+B;
    if(c_o) sum=sum+c_i;  //if A[i]+B[i] is 10 --> 11
    else{c_o,sum}=sum+c_i;
    carry_out=c_o;

//for(i=0;i<4;i=i+1)
//        begin
//        {c_o,sum[i]}=A[i]+B[i];#0;
//        if(c_o) sum[i]=sum[i]+c_i;  //if A[i]+B[i] is 10 --> 11
//        else{c_o,sum[i]}=sum[i]+c_i;
//        c_i=c_o;
//        end//endfor
//carry_out=c_o;

end//end always;
endmodule

//    
        
        

