//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/05/30 21:44:10
// Design Name: 
// Module Name: key_led_ctrl
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
//head file and library
#include "./key_led_blck.h"
#include "sleep.h"
#include "stdio.h"
////////////////////////////////////////////////
//static and public variable

////////////////////////////////////////////////
//function and note
int key_led_ctrl(
    int err   ,   //get before error code
	int mode  
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
    for(int i = 0; i < 4; i++)
    {
        for(int j = 0; j < 3; j++)
        {
            key_led_driv(0,0,i,j);
            printf("info: KEY == %d; INFO == %d \n\r",i,j);
            sleep(30);
        }
    }
    
    
    
//*********************************************
//return result by error
//---------------------------------------------
    return err;   //return error code
}
