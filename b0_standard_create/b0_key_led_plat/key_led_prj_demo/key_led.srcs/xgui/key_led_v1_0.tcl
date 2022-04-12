# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "PR_CLK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_KEY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_LED" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_SET" -parent ${Page_0}


}

proc update_PARAM_VALUE.PR_CLK { PARAM_VALUE.PR_CLK } {
	# Procedure called to update PR_CLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PR_CLK { PARAM_VALUE.PR_CLK } {
	# Procedure called to validate PR_CLK
	return true
}

proc update_PARAM_VALUE.WD_KEY { PARAM_VALUE.WD_KEY } {
	# Procedure called to update WD_KEY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_KEY { PARAM_VALUE.WD_KEY } {
	# Procedure called to validate WD_KEY
	return true
}

proc update_PARAM_VALUE.WD_LED { PARAM_VALUE.WD_LED } {
	# Procedure called to update WD_LED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_LED { PARAM_VALUE.WD_LED } {
	# Procedure called to validate WD_LED
	return true
}

proc update_PARAM_VALUE.WD_SET { PARAM_VALUE.WD_SET } {
	# Procedure called to update WD_SET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_SET { PARAM_VALUE.WD_SET } {
	# Procedure called to validate WD_SET
	return true
}


proc update_MODELPARAM_VALUE.WD_KEY { MODELPARAM_VALUE.WD_KEY PARAM_VALUE.WD_KEY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_KEY}] ${MODELPARAM_VALUE.WD_KEY}
}

proc update_MODELPARAM_VALUE.WD_LED { MODELPARAM_VALUE.WD_LED PARAM_VALUE.WD_LED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_LED}] ${MODELPARAM_VALUE.WD_LED}
}

proc update_MODELPARAM_VALUE.WD_SET { MODELPARAM_VALUE.WD_SET PARAM_VALUE.WD_SET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_SET}] ${MODELPARAM_VALUE.WD_SET}
}

proc update_MODELPARAM_VALUE.PR_CLK { MODELPARAM_VALUE.PR_CLK PARAM_VALUE.PR_CLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PR_CLK}] ${MODELPARAM_VALUE.PR_CLK}
}

