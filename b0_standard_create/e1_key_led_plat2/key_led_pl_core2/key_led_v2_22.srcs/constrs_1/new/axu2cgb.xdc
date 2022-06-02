# get the AXU2CGB board all ports used

## set PL clk
set pl_clk [get_ports * -filter {NAME =~ *i_pl_clk*} -quiet]
set_property IOSTANDARD LVCMOS18 [get_ports $pl_clk  -quiet] 
set_property PACKAGE_PIN AB11    [get_ports $pl_clk  -quiet] 

## set key 
set key0 [get_ports * -filter {NAME =~ *i_key*[0]*} -quiet] 
set key1 [get_ports * -filter {NAME =~ *i_key*[1]*} -quiet] 
set key2 [get_ports * -filter {NAME =~ *i_key*[2]*} -quiet] 
set key3 [get_ports * -filter {NAME =~ *i_key*[3]*} -quiet] 
set_property PACKAGE_PIN AA13    [get_ports "$key0" -quiet] 
set_property PACKAGE_PIN AE14    [get_ports "$key1" -quiet] 
set_property PACKAGE_PIN AE15    [get_ports "$key2" -quiet] 
set_property PACKAGE_PIN AG14    [get_ports "$key3" -quiet] 
set_property IOSTANDARD LVCMOS33 [get_ports "$key0" -quiet] 
set_property IOSTANDARD LVCMOS33 [get_ports "$key1" -quiet] 
set_property IOSTANDARD LVCMOS33 [get_ports "$key2" -quiet] 
set_property IOSTANDARD LVCMOS33 [get_ports "$key3" -quiet] 

## set led
set led0 [get_ports * -filter {NAME =~ *o_led*[0]*} -quiet]
set led1 [get_ports * -filter {NAME =~ *o_led*[1]*} -quiet]
set led2 [get_ports * -filter {NAME =~ *o_led*[2]*} -quiet]
set led3 [get_ports * -filter {NAME =~ *o_led*[3]*} -quiet]
set_property PACKAGE_PIN W13     [get_ports "$led0" -quiet]
set_property PACKAGE_PIN Y12     [get_ports "$led1" -quiet]
set_property PACKAGE_PIN AA12    [get_ports "$led2" -quiet]
set_property PACKAGE_PIN AB13    [get_ports "$led3" -quiet]
set_property IOSTANDARD LVCMOS33 [get_ports "$led0" -quiet]
set_property IOSTANDARD LVCMOS33 [get_ports "$led1" -quiet]
set_property IOSTANDARD LVCMOS33 [get_ports "$led2" -quiet]
set_property IOSTANDARD LVCMOS33 [get_ports "$led3" -quiet]