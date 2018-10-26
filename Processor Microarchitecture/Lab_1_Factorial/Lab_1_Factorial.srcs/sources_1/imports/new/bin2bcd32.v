module bin2bcd32(     input wire [31:0] value,    
                        output reg [3:0] dig0,     
                        output reg [3:0] dig1,    
                        output reg [3:0] dig2, 
                        output reg [3:0] dig3,  
                        output reg [3:0] dig4,   
                        output reg [3:0] dig5,    
                        output reg [3:0] dig6, 
                        output reg [3:0] dig7     );   

always@(value)
begin
 dig0 = value % 10;     
 dig1 = (value / 10) % 10; 
 dig2 = (value / 100) % 10; 
 dig3 = (value / 1000) % 10;
 dig4 = (value / 10000) % 10;  
 dig5 = (value / 100000) % 10; 
 dig6 = (value / 1000000) % 10; 
 dig7 = (value / 10000000) % 10;
end
endmodule  
