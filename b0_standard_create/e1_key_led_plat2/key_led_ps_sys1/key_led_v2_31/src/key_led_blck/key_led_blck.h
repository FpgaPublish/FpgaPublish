//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/05/30 22:09:14
// Design Name: 
// Module Name: key_led_blck
// Project Name: 
// Target Devices: ZYNQ7010 & XAUG
// Tool Versions: 2021.1
// Description: 
// 
// Dependencies: 
// 
// Revision: 0.01 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
int key_led_ctrl(
    int err   ,   //get before error code
	int mode  
);

int key_led_driv(
    int err   ,   //get before error code
	int mode  ,   //no used
    int key   ,   //key 0~3,
    int info      //info 0~2,normal warning error
);

