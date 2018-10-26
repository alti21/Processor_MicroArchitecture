`timescale 1ns / 1ps


module Factorial_tb();
    
    
    reg CLK, Go;
    reg [3:0]n;
    wire [31:0] Product_out;
    wire [2:0] CS;
    wire Done;
    integer i;//,j;
    integer ErrorCount=0;
    reg [31:0] ref;
    Factorial DUT(CLK, Go, n, Product_out, CS, Done
    );
            
        
    initial
    begin
    CLK=0; Go=0; ErrorCount=0;
    for(i=0; i<=10; i=i+1)
    begin
        if(i==1)
        begin
            ref=1;
        end
        ref=ref*i;
        n=i;#5;
        CLK=1; #5; CLK=0; Go=1; #5;
        CLK=1; #5; 
//            ref=n;
//            for(j=n-1; j>1; j=j-1)
//            begin
//            ref=ref*j;
//            end //end for j
        CLK=0; #5;
        Go=0;
        

        
        while(!Done)
         begin
         CLK=1; #5; CLK=0; #5;
         end

        if(Done)
        begin
            if(Product_out!=ref)
                begin
                $display("error at n=%d DP_out=%d ref=%d, %d", n, Product_out, ref, $time);
                ErrorCount=ErrorCount+1;
                end 
        end
         CLK=1; #5; CLK=0; #5;
    end//end for i
    if(ErrorCount==0)
    $display("Factorial tb test success");
end//end initial
endmodule
