# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "NB_VER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_BRAM_DAT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_BRAM_WEN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_ERR_INFO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_SHK_DLAY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WD_SHK_SYNC" -parent ${Page_0}


}

proc update_PARAM_VALUE.NB_VER { PARAM_VALUE.NB_VER } {
	# Procedure called to update NB_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NB_VER { PARAM_VALUE.NB_VER } {
	# Procedure called to validate NB_VER
	return true
}

proc update_PARAM_VALUE.WD_BRAM_DAT { PARAM_VALUE.WD_BRAM_DAT } {
	# Procedure called to update WD_BRAM_DAT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_BRAM_DAT { PARAM_VALUE.WD_BRAM_DAT } {
	# Procedure called to validate WD_BRAM_DAT
	return true
}

proc update_PARAM_VALUE.WD_BRAM_WEN { PARAM_VALUE.WD_BRAM_WEN } {
	# Procedure called to update WD_BRAM_WEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_BRAM_WEN { PARAM_VALUE.WD_BRAM_WEN } {
	# Procedure called to validate WD_BRAM_WEN
	return true
}

proc update_PARAM_VALUE.WD_ERR_INFO { PARAM_VALUE.WD_ERR_INFO } {
	# Procedure called to update WD_ERR_INFO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WD_ERR_INFO { PARAM_VALUE.WD_ERR_INFO } {
	# Procedure called to validate WD_ERR_INFO
	return true
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


proc update_MODELPARAM_VALUE.NB_VER { MODELPARAM_VALUE.NB_VER PARAM_VALUE.NB_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NB_VER}] ${MODELPARAM_VALUE.NB_VER}
}

proc update_MODELPARAM_VALUE.WD_SHK_SYNC { MODELPARAM_VALUE.WD_SHK_SYNC PARAM_VALUE.WD_SHK_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_SHK_SYNC}] ${MODELPARAM_VALUE.WD_SHK_SYNC}
}

proc update_MODELPARAM_VALUE.WD_SHK_DLAY { MODELPARAM_VALUE.WD_SHK_DLAY PARAM_VALUE.WD_SHK_DLAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_SHK_DLAY}] ${MODELPARAM_VALUE.WD_SHK_DLAY}
}

proc update_MODELPARAM_VALUE.WD_BRAM_DAT { MODELPARAM_VALUE.WD_BRAM_DAT PARAM_VALUE.WD_BRAM_DAT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_BRAM_DAT}] ${MODELPARAM_VALUE.WD_BRAM_DAT}
}

proc update_MODELPARAM_VALUE.WD_BRAM_WEN { MODELPARAM_VALUE.WD_BRAM_WEN PARAM_VALUE.WD_BRAM_WEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_BRAM_WEN}] ${MODELPARAM_VALUE.WD_BRAM_WEN}
}

proc update_MODELPARAM_VALUE.WD_ERR_INFO { MODELPARAM_VALUE.WD_ERR_INFO PARAM_VALUE.WD_ERR_INFO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WD_ERR_INFO}] ${MODELPARAM_VALUE.WD_ERR_INFO}
}

