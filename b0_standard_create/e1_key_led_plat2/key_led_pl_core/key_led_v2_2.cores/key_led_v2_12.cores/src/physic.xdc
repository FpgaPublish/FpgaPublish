##################################################################################
## Company: fpgaPublish
## Engineer: f
## 
## Create Date: 2022/05/16 21:06:26
## Design Name: physic
## Module Name: 
## Project Name: 
## Target Devices: 
## Tool Versions: 
## Description: 
## 
## Dependencies: 
##  
## Revision: 
## Revision 0.01 - File Created 
## Additional Comments:
## 
##################################################################################

set ports [get_ports -quiet]
set key0 [get_ports $ports -filter {NAME =~ *key_row*[0]*}]
set key1 [get_ports $ports -filter {NAME =~ *key_row*[1]*}]
set key2 [get_ports $ports -filter {NAME =~ *key_row*[2]*}]
set key3 [get_ports $ports -filter {NAME =~ *key_row*[3]*}]

set led0 [get_ports $ports -filter {NAME =~ *led_row*[0]*}]
set led1 [get_ports $ports -filter {NAME =~ *led_row*[1]*}]
set led2 [get_ports $ports -filter {NAME =~ *led_row*[2]*}]
set led3 [get_ports $ports -filter {NAME =~ *led_row*[3]*}]

# KEY
set_property PACKAGE_PIN AA13    [get_ports "$key0"]
set_property PACKAGE_PIN AE14    [get_ports "$key1"]
set_property PACKAGE_PIN AE15    [get_ports "$key2"]
set_property PACKAGE_PIN AG14    [get_ports "$key3"]
set_property IOSTANDARD LVCMOS33 [get_ports "$key0"]
set_property IOSTANDARD LVCMOS33 [get_ports "$key1"]
set_property IOSTANDARD LVCMOS33 [get_ports "$key2"]
set_property IOSTANDARD LVCMOS33 [get_ports "$key3"]
# LED
set_property PACKAGE_PIN W13     [get_ports "$led0"]
set_property PACKAGE_PIN Y12     [get_ports "$led1"]
set_property PACKAGE_PIN AA12    [get_ports "$led2"]
set_property PACKAGE_PIN AB13    [get_ports "$led3"]
set_property IOSTANDARD LVCMOS33 [get_ports "$led0"]
set_property IOSTANDARD LVCMOS33 [get_ports "$led1"]
set_property IOSTANDARD LVCMOS33 [get_ports "$led2"]
set_property IOSTANDARD LVCMOS33 [get_ports "$led3"]
