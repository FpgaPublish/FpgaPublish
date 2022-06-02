//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "E:/software_fpga/xilinx_software/Vitis/2021.1/bin;E:/software_fpga/xilinx_software/Vivado/2021.1/ids_lite/ISE/bin/nt64;E:/software_fpga/xilinx_software/Vivado/2021.1/ids_lite/ISE/lib/nt64;E:/software_fpga/xilinx_software/Vivado/2021.1/bin;";
} else {
  PathVal = "E:/software_fpga/xilinx_software/Vitis/2021.1/bin;E:/software_fpga/xilinx_software/Vivado/2021.1/ids_lite/ISE/bin/nt64;E:/software_fpga/xilinx_software/Vivado/2021.1/ids_lite/ISE/lib/nt64;E:/software_fpga/xilinx_software/Vivado/2021.1/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "vivado",
         "-log key_led_blck.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source key_led_blck.tcl" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
