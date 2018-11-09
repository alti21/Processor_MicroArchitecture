`timescale 1ns / 1ps

module regfile2_tb();

    reg clk_tb; //Clock
    reg we1_tb, we2_tb;  //write enable for write data ports 1 and 2 respectively
    reg [4:0] ra1_tb, ra2_tb;//read addresses for ports 1 and 2 respectively
    reg [4:0] wa1_tb, wa2_tb; //write addresses for ports 1 and 2 respectively
    reg [31:0] wd1_tb, wd2_tb; //write data for ports 1 and 2 respectively
    wire [31:0] rd1_tb, rd2_tb;  //read data for ports 1 and 2 respectively
    integer p1_i,p2_i;
  
   
    regfile2 RF( clk_tb, 
                we1_tb, we2_tb,  
                ra1_tb, ra2_tb, 
                wa1_tb, wa2_tb, 
                wd1_tb, wd2_tb, 
                rd1_tb, rd2_tb);   
    initial begin
    clk_tb=1;
    we1_tb = 1;
    we2_tb = 1;
    ra1_tb = 0;
    ra2_tb = 0;
    wd1_tb = 0;
    wd2_tb = 0;
    wa2_tb = 0;
  
    //TEST WRITE AND READ PORTS 1
    for(p1_i = 0; p1_i < 32; p1_i = p1_i + 1) 
    begin
        if(p1_i!=0) //Address zero is always 0.
        begin
        wd1_tb = p1_i + 100;
        wa1_tb = p1_i; //#10;
        end
        
        ra1_tb = p1_i;
        ra2_tb = p1_i; #10;
           
        if(ra1_tb==0 && rd1_tb!=0)
            $display("Address=0 read port 1 has an error.");
        else if (ra2_tb==0 && rd2_tb!=0)
            $display("Address=0 read port 2 has an error.");
        else if(ra1_tb!=0 && rd1_tb != (p1_i+100))
            $display("Address=%d with data=%d i=%d time%d read port 1 has an error.",ra1_tb,rd1_tb,p1_i,$time);
        else if(ra2_tb!=0 && rd2_tb != (p1_i+100))
            $display("Address=%d with data=%d i=%d time%d read port 2 has an error.",ra2_tb,rd2_tb,p1_i,$time);
    end
  
    #100;
    //TEST WRITE AND READ PORTS 2
    for(p2_i = 0; p2_i < 32; p2_i = p2_i + 1)
    begin
        if(p2_i!=0)
        begin
        wd2_tb = p2_i + 200;
        wa2_tb = p2_i; #5;
        end
        
        ra1_tb = p2_i;
        ra2_tb = p2_i; #5;
        
        if(ra1_tb==0 && rd1_tb!=0)
           $display("Address=0 read port 1 has an error.");
        else if (ra2_tb==0 && rd2_tb!=0)
           $display("Address=0 read port 2 has an error.");
        else if(ra1_tb!=0 && rd1_tb != (p2_i+200))
           $display("Address=%d with data=%d i=%d time%d read port 1 has an error.",ra1_tb,rd1_tb,p2_i,$time);
        else if(ra2_tb!=0 && rd2_tb != (p2_i+200))
           $display("Address=%d with data=%d i=%d time%d read port 2 has an error.",ra2_tb,rd2_tb,p2_i,$time);
    end 
          
    #50
    //TEST CORNER CASE WE1=1 WA1=RA1=RA2  
    we1_tb=1;
    wd1_tb=1111;
    wa1_tb=11;
    ra1_tb=11;
    ra2_tb=11;
    
    #50
    //TEST CORNER CASE WE2=1 WA2=RA1=RA2
    we2_tb=1;
    wd2_tb=2222;
    wa2_tb=22;
    ra1_tb=22;
    ra2_tb=22;
            
    
    $display("Test Success.");
end

    always #2.5 clk_tb<=~clk_tb; 
    always #5 we1_tb<=~we1_tb; 
    always #5 we2_tb<=~we2_tb;       
          
endmodule