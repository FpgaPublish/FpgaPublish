
?
=Use of init.tcl in %s is deprecated. Please use %s_init.tcl 
656*common2G
3C:/Users/FJB/AppData/Roaming/Xilinx/Vivado/init.tcl2default:default2
Vivado2default:defaultZ17-1460h px? 
?
Sourcing tcl script '%s'
201*common2G
3C:/Users/FJB/AppData/Roaming/Xilinx/Vivado/init.tcl2default:defaultZ17-201h px? 
>
Refreshing IP repositories
234*coregenZ19-234h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2k
Wd:/e1_library/e1_key_led_plat2/key_led_pl_core2/key_led_v2_22.cores/key_led_v2_13.cores2default:defaultZ19-1700h px? 
?
?If you move the project, the path for repository '%s' may become invalid. A better location for the repostory would be in a path adjacent to the project. (Current project location is '%s'.)1680*coregen2k
Wd:/e1_library/e1_key_led_plat2/key_led_pl_core2/key_led_v2_22.cores/key_led_v2_13.cores2default:default2?
wd:/e1_library/e1_key_led_plat2/key_led_pl_core2/key_led_v2_22.cores/key_led_v2_13.cores/key_led_v2_13_core.runs/synth_12default:defaultZ19-3656h px? 
?
"Loaded Vivado IP repository '%s'.
1332*coregen2J
6E:/software_fpga/xilinx_software/Vivado/2021.1/data/ip2default:defaultZ19-2313h px? 
?
?The host OS only allows 260 characters in a normal path. The IP cache path is more than 80 characters. If you experience issues with IP caching, please consider changing the IP cache to a location with a shorter path. Alternately consider using the OS subst command to map part of the path to a drive letter. 
Current IP cache path is %s 2293*coregen2?
sd:/e1_library/e1_key_led_plat2/key_led_pl_core2/key_led_v2_22.cores/key_led_v2_13.cores/key_led_v2_13_core.cache/ip2default:defaultZ19-4995h px? 
}
Command: %s
53*	vivadotcl2L
8synth_design -top key_led_blck -part xczu2cg-sfvc784-2-e2default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xczu2cg2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xczu2cg2default:defaultZ17-349h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
69402default:defaultZ8-7075h px? 
?
%s*synth2?
rStarting Synthesize : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 1257.574 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2 
key_led_blck2default:default2
 2default:default2?
jD:/e1_library/e1_key_led_plat2/key_led_pl_core2/key_led_v2_22.cores/key_led_v2_13.cores/src/key_led_blck.v2default:default2
262default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
key_led_blck2default:default2
 2default:default2
12default:default2
12default:default2?
jD:/e1_library/e1_key_led_plat2/key_led_pl_core2/key_led_v2_22.cores/key_led_v2_13.cores/src/key_led_blck.v2default:default2
262default:default8@Z8-6155h px? 
?
%s*synth2?
rFinished Synthesize : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 1257.574 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1257.574 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
N
%s
*synth26
"Loading part: xczu2cg-sfvc784-2-e
2default:defaulth p
x
? 
B
 Reading net delay rules and data4578*oasysZ8-6742h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1257.574 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
Loading part %s157*device2'
xczu2cg-sfvc784-2-e2default:defaultZ21-403h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2

cstate_reg2default:default2 
key_led_blck2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    IDLE |                          0000001 |                             0000
2default:defaulth p
x
? 
?
%s
*synth2s
_                   START |                          1000000 |                             0001
2default:defaulth p
x
? 
?
%s
*synth2s
_                    MODE |                          0100000 |                             0010
2default:defaulth p
x
? 
?
%s
*synth2s
_                  NORMAL |                          0010000 |                             0011
2default:defaulth p
x
? 
?
%s
*synth2s
_                    WARN |                          0001000 |                             0100
2default:defaulth p
x
? 
?
%s
*synth2s
_                   ERROR |                          0000100 |                             0101
2default:defaulth p
x
? 
?
%s
*synth2s
_                    WAIT |                          0000010 |                             0110
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2

cstate_reg2default:default2
one-hot2default:default2 
key_led_blck2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1257.574 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 5     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    7 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    7 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 10    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:72)
BRAMs: 300 (col length: RAMB18 72 RAMB36 36)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Timing Optimization : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Technology Mapping : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
vFinished IO Insertion : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY8 |     4|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |     3|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |     3|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |     7|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |     2|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |     6|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |    10|
2default:defaulth px? 
D
%s*synth2,
|9     |FDRE   |    43|
2default:defaulth px? 
D
%s*synth2,
|10    |FDSE   |     5|
2default:defaulth px? 
D
%s*synth2,
|11    |IBUF   |    22|
2default:defaulth px? 
D
%s*synth2,
|12    |OBUF   |     4|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
N
%s
*synth26
"|      |Instance |Module |Cells |
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
N
%s
*synth26
"|1     |top      |       |   110|
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Runtime : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1660.230 ; gain = 402.656
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1660.2302default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
272default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1660.2302default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2?
y  A total of 23 instances were transformed.
  BUFG => BUFGCE: 1 instance 
  IBUF => IBUF (IBUFCTRL, INBUF): 22 instances
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
1ac1d3df2default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
202default:default2
22default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:132default:default2
00:00:152default:default2
1660.2302default:default2
402.6562default:defaultZ17-268h px? 
~
4The following parameters have non-default value.
%s
395*common2&
general.maxThreads2default:defaultZ17-600h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?D:/e1_library/e1_key_led_plat2/key_led_pl_core2/key_led_v2_22.cores/key_led_v2_13.cores/key_led_v2_13_core.runs/synth_1/key_led_blck.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
nExecuting : report_utilization -file key_led_blck_utilization_synth.rpt -pb key_led_blck_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue May 24 22:28:15 20222default:defaultZ17-206h px? 


End Record