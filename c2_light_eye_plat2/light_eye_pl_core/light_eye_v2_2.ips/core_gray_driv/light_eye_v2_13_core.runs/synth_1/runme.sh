#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=E:/software_fpga/xilinx_software/Vitis/2021.1/bin;E:/software_fpga/xilinx_software/Vivado/2021.1/ids_lite/ISE/bin/nt64;E:/software_fpga/xilinx_software/Vivado/2021.1/ids_lite/ISE/lib/nt64:E:/software_fpga/xilinx_software/Vivado/2021.1/bin
else
  PATH=E:/software_fpga/xilinx_software/Vitis/2021.1/bin;E:/software_fpga/xilinx_software/Vivado/2021.1/ids_lite/ISE/bin/nt64;E:/software_fpga/xilinx_software/Vivado/2021.1/ids_lite/ISE/lib/nt64:E:/software_fpga/xilinx_software/Vivado/2021.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='D:/e1_library/f2_light_eye_plat2/light_eye_pl_core/light_eye_v2_2.ips/core_gray_driv/light_eye_v2_13_core.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log gray_driv.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source gray_driv.tcl