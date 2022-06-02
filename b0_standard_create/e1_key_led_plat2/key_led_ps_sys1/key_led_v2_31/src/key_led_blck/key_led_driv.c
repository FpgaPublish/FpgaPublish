//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/05/30 21:44:41
// Design Name: 
// Module Name: key_led_driv
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
////////////////////////////////////////////////
//head file and library and macro
#define ADDR_GPIO0_M 0x0080000000
#define ADDR_GPIO1_M 0x0080010000
#define ADDR_GPIO_D0 0x0000
#define ADDR_GPIO_D1 0x0008

#define NORMAL  0x0000
#define OUTSIDE 0x0001

#include "xil_io.h"
#include "key_led_blck.h"

////////////////////////////////////////////////
//static  and public variable

////////////////////////////////////////////////
//function and note
int key_led_driv(
    int err   ,   //get before error code
	int mode  ,   //
    int key   ,   //key 0~3,
    int info      //info 0~2,normal warning error
){
//*********************************************
//parameter and constant
//---------------------------------------------
    
//*********************************************
//variable and number array
//---------------------------------------------
    
//*********************************************
//logic and calculate
//---------------------------------------------
    switch(key)
    {
        case 0: Xil_Out32(ADDR_GPIO0_M + ADDR_GPIO_D0, info); break;
        case 1: Xil_Out32(ADDR_GPIO0_M + ADDR_GPIO_D1, info); break;
        case 2: Xil_Out32(ADDR_GPIO1_M + ADDR_GPIO_D0, info); break;
        case 3: Xil_Out32(ADDR_GPIO1_M + ADDR_GPIO_D1, info); break;
        default: err = OUTSIDE;break;
    }
//*********************************************
//return result by error
//---------------------------------------------
    return err;   //return error code
}
