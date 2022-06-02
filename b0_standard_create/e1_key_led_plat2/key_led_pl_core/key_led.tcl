##################################################################################
## Company: fpgaPublish
## Engineer: f
## 
## Create Date: 2022/03/13 19:13:31
## Design Name: create_prj_axucg
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

variable My_File [file normalize [info script]]
#prj path
set prj_path_file [file nativename $My_File]
puts $prj_path_file
set prj_path [file dirname $prj_path_file]
#file name
set prj_name [file tail $prj_path_file]
set prj_name [string trimright $prj_name ?.tcl?] 
puts $prj_name 

#set prj_name key_led_prj
#set prj_path D:/b3_standard_prj/b1_debug_sys/c0_key_led_prj/
if { [regexp {_(plat)([0-9]*)/} $prj_path -> v1 v2] } {
    set v2 $v2 
} else {
    set v2 0
}
if { [regexp {_pl_(demo)([0-9]*)} $prj_path -> v3 v4] } {
    set v3 0$v4 
} elseif { [regexp {_pl_(work)([0-9]*)} $prj_path -> v3 v4] } {
    set v3 1$v4 
} elseif { [regexp {_pl_(core)([0-9]*)} $prj_path -> v3 v4] } {
    set v3 2$v4 
} else {
    set v3 00
}

append prj_name "_v${v2}_${v3}"
#new prj
create_project $prj_name $prj_path -part xczu2cg-sfvc784-2-e

#set sim lib
#set_property compxlib.modelsim_compiled_library_dir D:/software_to_instell_expend/software14/vivado2019 [current_project]
set_property compxlib.modelsim_compiled_library_dir E:/software_fpga/xilinx_software/sim_lib [current_project]
#set sim tool to modelsim
set_property target_simulator ModelSim [current_project]
set_property -name {modelsim.simulate.vsim.more_options} -value {-coverage} -objects [get_filesets sim_1]



#suppress message
# set_msg_config -suppress -id {Labtoolstcl 44-513} 
# set_msg_config -suppress -id {filemgmt 56-3} 

#add file
set prj_srcs_path $prj_path
append prj_srcs_path "/"
append prj_srcs_path $prj_name
append prj_srcs_path ".srcs"
file mkdir $prj_srcs_path/sources_1/new
file mkdir $prj_srcs_path/sources_1/ip
close [ open $prj_srcs_path/sources_1/ip/list_ip.tcl w]
#update_compile_order -fileset sources_1

#add constrain
file mkdir $prj_srcs_path/constrs_1
file mkdir $prj_srcs_path/constrs_1/new
close [ open $prj_srcs_path/constrs_1/new/physic.xdc w ]
add_files -fileset constrs_1 $prj_srcs_path/constrs_1/new/physic.xdc
close [ open $prj_srcs_path/constrs_1/new/timing.xdc w ]
add_files -fileset constrs_1 $prj_srcs_path/constrs_1/new/timing.xdc

#add timing
set prj_time_path $prj_path
append prj_time_path "/"
append prj_time_path $prj_name
append prj_time_path ".timing"
file mkdir $prj_time_path/synthesis
file mkdir $prj_time_path/implement

# add sim
file mkdir $prj_srcs_path/sim_1
file copy $::env(P_CREATE_PROJECT)tb_assert.sv $prj_srcs_path/sim_1/tb_${prj_name}.sv
add_files -fileset sim_1 $prj_srcs_path/sim_1/tb_${prj_name}.sv

# add data tmp path
set prj_data "${prj_path}/${prj_name}.data"
file mkdir $prj_data

#add boots
set prj_boots ${prj_path}/${prj_name}.boots
file mkdir $prj_boots
#add cores
set prj_cores ${prj_path}/${prj_name}.cores
file mkdir $prj_cores
#get time
set now [clock seconds]
set timestr [clock format $now -format "%y/%m/%d %H:%M:%S"]

#get sum version.md
set s_tcl_sum version.md
set p_tcl_sum $::env(P_TCL_VERSION)
set f_tcl_sum $p_tcl_sum$s_tcl_sum

# get project version.md
set f_prj_ver "${prj_path}/version.md"
set f [open $f_prj_ver w+]
add_files -fileset utils_1 -norecurse $f_prj_ver

# write to file
set f [open $f_tcl_sum a+]
puts $f {*}
puts $f {* ##################   create project   ############################}
puts $f "* project name:${prj_name}"
puts $f "* created time:${timestr}"    
puts $f "* project path:${prj_path}"
puts $f "* version file:\[version.md\](${f_prj_ver})"
puts $f {* ##################################################################}
puts $f {*}
close $f
