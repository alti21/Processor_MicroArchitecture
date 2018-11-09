`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2017 07:08:40 PM
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb( );
    /*reg [3:0]A_tb;
    reg [3:0]B_tb;
    reg clk_50;
    reg rst_1;
    reg enable;
    wire [3:0]a_regtb;
    wire [3:0] b_regtb;
    wire [7:0] product_tb;
    wire [7:0] p_ref;
    reg [7:0] product_ref;
    integer a_test,b_test;
    integer ErrorCount;
   // parameter WIDTH=4;
    multiplier P(.mA(A_tb),.mB(B_tb),.clock(clk_50),.enb(enable),.rst(rst_1),.product(product_tb));
   // inferred_multiplier I_M(.aref(A_tb),.bref(B_tb),.pref(product_ref));
   // registerA #(WIDTH==4) tb_one(.clk(clk_50), .reset(rst_1), .d(a_test), .q(a_regtb));
   // registerA #(WIDTH==4) tb_two(.clk(clk_50), .reset(rst_1), .d(b_test), .q(b_regtb));
    always #2 clk_50 <= ~clk_50;
    
    initial begin
        clk_50 = 1'b0;
        rst_1 = 0;
        enable = 1;
        //#2// rst_1 = 1'b1;
        
        ErrorCount=0;
        for(a_test=0; a_test<16; a_test=a_test+1) 
        begin
     //   registerA tb_one(.clk(clk_50), .reset(rst_1), .d(a_test), .q(a_regtb));
        assign A_tb=a_test; 
            for(b_test=0; b_test<16; b_test=b_test+1) 
            begin
           // registerA tb_two(.clk(clk_50), .reset(rst_1), .d(b_test), .q(b_regtb));
            assign B_tb=b_test; #5
           //     @(negedge clk_50);
                product_ref = A_tb*B_tb; 
                if(product_tb!=p_ref)
                begin
                $display("Error at  A=%b B=%b CLA_sum=%b and Inf_sum=%b at time=%d", A_tb,B_tb,product_tb,product_ref,$time);
                
                ErrorCount=ErrorCount+1;
                end
                
            end
        end
        $display("There were %d errors in the CLA adder",ErrorCount);
        end//end initial
        
        registerA one(.clk(clock), .reset(0), .en(1), .d(product_ref), .q(a_regtb));
        registerA two(.clk(clock), .reset(0), .en(1), .d(a_regtb), .q(b_regtb));
        registerA three(.clk(clock), .reset(0), .en(1),.d(b_regtb), .q(p_ref));*/
        reg clock_tb;
        
        reg [3:0] A_tb, B_tb;
        wire [7:0] P_tb;
        
        reg [7:0] P_inferred;
        wire[7:0] sig1,sig2;
        wire [7:0] P_ref; 
        
        integer a_i,b_i;
        integer ErrorCount;
        
        
        multiplier Pipeline_Multiplication(.mA( A_tb ), .mB( B_tb ),.clock(clock_tb),.enb( 1 ), .rst( 1'b0 ),  .product( P_tb ));
        initial
        begin
        clock_tb=0;
        ErrorCount=0;
        for(a_i=0; a_i<15; a_i=a_i+1)//2^4=16
        begin
            assign A_tb=a_i; //#4;
            for(b_i=0; b_i<15; b_i=b_i+1)//2^4=16
            begin
            assign B_tb=b_i; 
            P_inferred=A_tb*B_tb; #4;
            if(P_tb!=P_ref)
            begin
            ErrorCount=ErrorCount+1;
            $display("There was an error at A=%d B=%d and time=%d", A_tb, B_tb, $time);
            end
            end//end b_i
        end//end a_i
        $display("Test Successful! There were %d errors in the pipelined multiplier simulation.", ErrorCount);
        end//end intial
        
        always #2 clock_tb<=~clock_tb;
        
        //Delay inferred product so it matches with Pipelined Product
        registerd In( .clok( clock_tb ), .resetbits( 0 ), .enl( 1 ), .data ( P_inferred ), .out( sig1 )); 
        registerd Stage( .clok( clock_tb ), .resetbits( 0 ), .enl( 1 ), .data ( sig1 ), .out( sig2 )); 
        registerd Out( .clok( clock_tb ), .resetbits( 0 ), .enl( 1 ), .data ( sig2 ), .out( P_ref )); 

endmodule
