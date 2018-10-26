`timescale 1ns / 1ps

module DP_tb(

    );
    reg CLK,  ld_CNT, en_CNT, s_in, ld_Product, s_out;
    reg [3:0] n;
//    wire [3:0] CNT_out;
    wire GT;
    wire [31:0] Product_out;//Product,P_Q, m_out   ;
    integer i;
    integer ErrorCount;
//    integer j;
    reg [31:0] ref;
    
    factorial_DP DUT(CLK, n, ld_CNT, en_CNT, s_in, ld_Product, s_out, Product_out, GT    );

initial begin
CLK=0;
ErrorCount=0;
{ld_CNT, en_CNT, s_in, ld_Product, s_out}=6'b00000;
    for(i=0;i<=10;i=i+1)
    begin
        if(i==1)
        begin
            ref=1;
        end
        ref=ref*i;
        n=i; 
        {ld_CNT, en_CNT, s_in, ld_Product, s_out}=6'b11110;
        #5;CLK=1; #5; CLK=0;
        {ld_CNT, en_CNT, s_in, ld_Product, s_out}=6'b00000;
        #5;CLK=1; #5; CLK=0;
        while(GT)
        begin
            {ld_CNT, en_CNT, s_in, ld_Product, s_out}=6'b01010;
            #5;CLK=1; #5; CLK=0;
        end
        {ld_CNT, en_CNT, s_in, ld_Product, s_out}=6'b00000;
        #5;CLK=1; #5; CLK=0;
        {ld_CNT, en_CNT, s_in, ld_Product, s_out}=6'b00001;
          
                   #5;CLK=1; #5; CLK=0; 
//            ref=n;
//            for(j=n-1; j>1; j=j-1)
//            begin
//            ref=ref*j;
//            end 
            if(Product_out!=ref)
            begin
            $display("error at n=%d DP_out=%d ref=%d, %d", n, Product_out, ref, $time);
            ErrorCount=ErrorCount+1;
            end
    end
    if(ErrorCount==0)
     $display("Factorial Datapath tb test success");
     
end//end initial
endmodule
