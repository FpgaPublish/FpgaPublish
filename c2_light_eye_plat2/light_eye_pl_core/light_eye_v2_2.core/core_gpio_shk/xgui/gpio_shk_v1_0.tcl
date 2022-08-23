# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "WD_DLAY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_GPIO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_SYNC" -parent ${Page_0}


}

proc update_PARAM_VALUE.WD_DLAY { PARAM_VALUE.WD_DLAY } {
	# Procedure called to update WD_DLAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_DLAY { PARAM_VALUE.WD_DLAY } {
	# Procedure called to validate WD_DLAY
	return true
}

proc update_PARAM_VALUE.WD_GPIO { PARAM_VALUE.WD_GPIO } {
	# Procedure called to update WD_GPIO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_GPIO { PARAM_VALUE.WD_GPIO } {
	# Procedure called to validate WD_GPIO
	return true
}

proc update_PARAM_VALUE.WD_SYNC { PARAM_VALUE.WD_SYNC } {
	# Procedure called to update WD_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_SYNC { PARAM_VALUE.WD_SYNC } {
	# Procedure called to validate WD_SYNC
	return true
}


proc update_MODELPARAM_VALUE.WD_GPIO { MODELPARAM_VALUE.WD_GPIO PARAM_VALUE.WD_GPIO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_GPIO}] ${MODELPARAM_VALUE.WD_GPIO}
}

proc update_MODELPARAM_VALUE.WD_SYNC { MODELPARAM_VALUE.WD_SYNC PARAM_VALUE.WD_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_SYNC}] ${MODELPARAM_VALUE.WD_SYNC}
}

proc update_MODELPARAM_VALUE.WD_DLAY { MODELPARAM_VALUE.WD_DLAY PARAM_VALUE.WD_DLAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_DLAY}] ${MODELPARAM_VALUE.WD_DLAY}
}

