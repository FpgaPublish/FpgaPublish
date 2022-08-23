# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "WD_SHK_DLAY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_SHK_SYNC" -parent ${Page_0}


}

proc update_PARAM_VALUE.WD_SHK_DLAY { PARAM_VALUE.WD_SHK_DLAY } {
	# Procedure called to update WD_SHK_DLAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_SHK_DLAY { PARAM_VALUE.WD_SHK_DLAY } {
	# Procedure called to validate WD_SHK_DLAY
	return true
}

proc update_PARAM_VALUE.WD_SHK_SYNC { PARAM_VALUE.WD_SHK_SYNC } {
	# Procedure called to update WD_SHK_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_SHK_SYNC { PARAM_VALUE.WD_SHK_SYNC } {
	# Procedure called to validate WD_SHK_SYNC
	return true
}


proc update_MODELPARAM_VALUE.WD_SHK_SYNC { MODELPARAM_VALUE.WD_SHK_SYNC PARAM_VALUE.WD_SHK_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_SHK_SYNC}] ${MODELPARAM_VALUE.WD_SHK_SYNC}
}

proc update_MODELPARAM_VALUE.WD_SHK_DLAY { MODELPARAM_VALUE.WD_SHK_DLAY PARAM_VALUE.WD_SHK_DLAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_SHK_DLAY}] ${MODELPARAM_VALUE.WD_SHK_DLAY}
}

