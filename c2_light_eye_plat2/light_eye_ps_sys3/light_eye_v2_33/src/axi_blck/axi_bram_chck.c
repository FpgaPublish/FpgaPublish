//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/08/14 17:06:29
// Design Name: 
// Module Name: axi_bram_chck
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
#include "../MACRO.h"
#include "axi_bram_chck.h"
#include "axi_bram_ctrl.h"
#include "xil_printf.h"
////////////////////////////////////////////////
//static and public variable

////////////////////////////////////////////////
//function and note

int chck_bram(

){
    uint8 rgb[9];
    uint8 rgb2[12];
    for(uint8 i = 0; i < 9; i = i + 1)
    {
        rgb[i] = i;
    }
    read_bram(rgb2,12,0,DEVC_BRAM0);
    write_bram(0,rgb,9,0,DEVC_BRAM0);
    xil_printf("info: write BRAM once\n\r");
    return ERR_NO_ERR;
}
