`timescale 1ns / 1ps

module inferred_adder_tb();
reg [3:0] A_tb;
reg [3:0] B_tb;
reg carryin_tb;
wire co_tb;
wire [3:0] sum_tb;  //what is net? concurrent assign to a non-net not permitted error...
integer a_i, b_i; //incrementers
reg [4:0] temp_sum;
integer ErrorCount;
integer c_i;

inferred_adder DUT(.carryin(carryin_tb), .A(A_tb),.B(B_tb),.carry_out(co_tb), .sum(sum_tb));

initial begin
    ErrorCount=0;
    for(a_i=0; a_i<16; a_i=a_i+1) //4bits ----> 2^4=16
    begin
    assign A_tb=a_i;
        for(b_i=0; b_i<16; b_i=b_i+1) //4bits --->2^4=16
        begin
        assign B_tb=b_i; #2;//DO NOT MAKE #0
            for(c_i=0; c_i<2; c_i=c_i+1)
            begin  
            assign carryin_tb=c_i; #0;//was 1
            temp_sum=A_tb+B_tb; //temp_sum is 5 bits. sum_tb is 4 bits
            temp_sum= temp_sum+ carryin_tb;
            
            if(temp_sum!=={co_tb,sum_tb})
                begin
                $display("Error at input A=%d B=%d at time=%d",A_tb,B_tb,$time);
                ErrorCount=ErrorCount+1;
                end//end if
            end//end c_i
        end//end b_i
    end//end a_i
    $display("There were %d errors in the inferred adder",ErrorCount);
end//end initial
endmodule
