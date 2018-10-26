`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2017 02:23:47 PM
// Design Name: 
// Module Name: shifter_rotator_tb
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


module shifter_rotator_tb;
        reg [3:0]Input_tb;
        reg [2:0]Ctrl;
        wire [3:0]Output_tb;
        integer m, n, q;
    
        shifterotator dut (Ctrl, Input_tb, Output_tb);
    
        initial begin
            for(m = 0; m < 16; m=m+1)
                begin
                    Input_tb = m;
                    #10;
                    for(n = 0; n < 8; n=n+1)
                        begin
                         Ctrl = n;
                            #10;
                            case(n)
                                 0:  q = Input_tb;
                                 1:  q = Input_tb >> 1;
                                 2:  q = Input_tb >> 2;
                                 3:  q = Input_tb >> 3;
                                 4:  q = Input_tb >> 4;
                                 5:  q = {Input_tb[0], Input_tb[3:1]};
                                 6:  q = {Input_tb[1:0], Input_tb[3:2]};
                               7:  q = {Input_tb[2:0], Input_tb[3]};
                            endcase
                          if(q != Output_tb)
                                begin
                                $display("Test was unsuccessful at control $d", Ctrl);
                                 end
                           
                         
                               //  begin
                               //   $display("No errors detected during test run.");
                               //   end
                        end   
                     //   if(m==10) begin//waveform ends when m=10
                     //                                   $display("No errors detected during test run.");
                    //                                    end
                         //$display("No errors detected during test run."); 
            end
         
         $display("No errors detected during test run.");
        end 
 $stop #2000
endmodule
