#Clock
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {clk100MHz}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk100MHz}];
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {rst}];#BTNC

#Input Debouncer Button
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { Debouncer_button }];#BTNL

#input Go
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { Go }]; #btnd


#input n
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { N[0] }]; #sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { N[1] }]; #sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { N[2] }]; #sw[2]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { N[3] }]; #sw[3]


set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { CS[0] }]; #led[0]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { CS[1] }]; #led[1]
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { CS[2] }]; #led[2]

#output Done
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { Done }];#led[11]

#Which 7-segment display to use
set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[0]}]; #right-most 7-seg display1
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[1]}];
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[2]}];
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[3]}];
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[4]}];
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[5]}];
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[6]}];
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[7]}]; #left-most 7-seg display2

#What to display at the 7-seg displays ALL ACTIVE LOW
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[0]}]; 
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[1]}]; 
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[2]}]; 
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[3]}];  
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[4]}]; 
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[5]}]; 
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[6]}]; 
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[7]}]; 