# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  #Adding Group
  set Width_Setting [ipgui::add_group $IPINST -name "Width Setting" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "WD_LED" -parent ${Width_Setting}
  ipgui::add_param $IPINST -name "WD_KEY" -parent ${Width_Setting}
  ipgui::add_param $IPINST -name "WD_INFO" -parent ${Width_Setting}

  #Adding Group
  set Delay_Setting [ipgui::add_group $IPINST -name "Delay Setting" -parent ${Page_0}]
  set NB_DLY [ipgui::add_param $IPINST -name "NB_DLY" -parent ${Delay_Setting}]
  set_property tooltip {Nb Dly of working} ${NB_DLY}
  set NB_SLOW [ipgui::add_param $IPINST -name "NB_SLOW" -parent ${Delay_Setting}]
  set_property tooltip {Delay = 2 ^ N} ${NB_SLOW}
  set NB_FAST [ipgui::add_param $IPINST -name "NB_FAST" -parent ${Delay_Setting}]
  set_property tooltip {Delay = 2 ^ N} ${NB_FAST}

  #Adding Group
  set Mode_Setting [ipgui::add_group $IPINST -name "Mode Setting" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "MD_LIGHT" -parent ${Mode_Setting} -widget comboBox
  ipgui::add_param $IPINST -name "MD_PRESS" -parent ${Mode_Setting} -widget comboBox



}

proc update_PARAM_VALUE.MD_LIGHT { PARAM_VALUE.MD_LIGHT } {
	# Procedure called to update MD_LIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MD_LIGHT { PARAM_VALUE.MD_LIGHT } {
	# Procedure called to validate MD_LIGHT
	return true
}

proc update_PARAM_VALUE.MD_PRESS { PARAM_VALUE.MD_PRESS } {
	# Procedure called to update MD_PRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MD_PRESS { PARAM_VALUE.MD_PRESS } {
	# Procedure called to validate MD_PRESS
	return true
}

proc update_PARAM_VALUE.NB_DLY { PARAM_VALUE.NB_DLY } {
	# Procedure called to update NB_DLY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NB_DLY { PARAM_VALUE.NB_DLY } {
	# Procedure called to validate NB_DLY
	return true
}

proc update_PARAM_VALUE.NB_FAST { PARAM_VALUE.NB_FAST } {
	# Procedure called to update NB_FAST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NB_FAST { PARAM_VALUE.NB_FAST } {
	# Procedure called to validate NB_FAST
	return true
}

proc update_PARAM_VALUE.NB_SLOW { PARAM_VALUE.NB_SLOW } {
	# Procedure called to update NB_SLOW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NB_SLOW { PARAM_VALUE.NB_SLOW } {
	# Procedure called to validate NB_SLOW
	return true
}

proc update_PARAM_VALUE.WD_INFO { PARAM_VALUE.WD_INFO } {
	# Procedure called to update WD_INFO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_INFO { PARAM_VALUE.WD_INFO } {
	# Procedure called to validate WD_INFO
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


proc update_MODELPARAM_VALUE.WD_KEY { MODELPARAM_VALUE.WD_KEY PARAM_VALUE.WD_KEY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_KEY}] ${MODELPARAM_VALUE.WD_KEY}
}

proc update_MODELPARAM_VALUE.WD_LED { MODELPARAM_VALUE.WD_LED PARAM_VALUE.WD_LED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_LED}] ${MODELPARAM_VALUE.WD_LED}
}

proc update_MODELPARAM_VALUE.WD_INFO { MODELPARAM_VALUE.WD_INFO PARAM_VALUE.WD_INFO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_INFO}] ${MODELPARAM_VALUE.WD_INFO}
}

proc update_MODELPARAM_VALUE.MD_PRESS { MODELPARAM_VALUE.MD_PRESS PARAM_VALUE.MD_PRESS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MD_PRESS}] ${MODELPARAM_VALUE.MD_PRESS}
}

proc update_MODELPARAM_VALUE.MD_LIGHT { MODELPARAM_VALUE.MD_LIGHT PARAM_VALUE.MD_LIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MD_LIGHT}] ${MODELPARAM_VALUE.MD_LIGHT}
}

proc update_MODELPARAM_VALUE.NB_DLY { MODELPARAM_VALUE.NB_DLY PARAM_VALUE.NB_DLY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NB_DLY}] ${MODELPARAM_VALUE.NB_DLY}
}

proc update_MODELPARAM_VALUE.NB_FAST { MODELPARAM_VALUE.NB_FAST PARAM_VALUE.NB_FAST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NB_FAST}] ${MODELPARAM_VALUE.NB_FAST}
}

proc update_MODELPARAM_VALUE.NB_SLOW { MODELPARAM_VALUE.NB_SLOW PARAM_VALUE.NB_SLOW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NB_SLOW}] ${MODELPARAM_VALUE.NB_SLOW}
}

