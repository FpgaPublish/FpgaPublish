##################################################################################
## Company: fpgaPublish
## Engineer: f
## 
## Create Date: 2022/04/08 22:41:35
## Design Name: create_application
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
########################################################
## get script file name 
variable file_self [file normalize [info script]]
set pns_self [file nativename $file_self]
set p_self [file dirname $pns_self]
set ns_self [file tail $pns_self]
set n_self [string trimright $ns_self ?.tcl?]
set s_self ".tcl"
########################################################
## get version
set v_plat 0
if { [regexp {_(plat)([0-9]*)/} $p_self -> v1 v2] } {
    if {$v1 == "plat"} {
        set v_plat "$v2"
    } 
} 
set v_ps 0
if { [regexp {_ps_(sys)([0-9]*)} $p_self -> v3 v4] } {
        set v_ps "3$v4" 
    }
set n_script $n_self
append n_self "_v${v_plat}_${v_ps}"
########################################################
## get first xsa path
set list_file [glob -directory $p_self "*.xsa"]
puts $list_file
set pns_platform [lrange $list_file 0 0]
set ns_platform [file tail $pns_platform]
set n_platform [string trimright $ns_platform ?.xsa?]
# create vitis application
# create a new platform
cd $p_self
setws $p_self
getws
platform create -name $n_platform -hw $pns_platform -proc psu_cortexa53_0 -os standalone -arch 64-bit -out $p_self
domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}
#importprojects $p_self/$n_platform
platform active $n_platform
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
repo -add-platforms $n_platform
#Create a new application
app create -name $n_self -platform $n_platform -domain standalone_domain 
#Build platform project
platform generate
#Build application project
set n_self_sys "${n_self}_system"
sysproj build -name $n_self_sys

########################################################
## create data to save test data
file mkdir $p_self/${n_self}.data
close [open $p_self/${n_self}.data/version.md w+]

########################################################
## change the file name
file rename "$p_self/${n_self}/src/helloworld.c" "$p_self/${n_self}/src/${n_script}_main.c" 
