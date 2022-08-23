//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/08/14 13:38:44
// Design Name: 
// Module Name: axi_bram_ctrl
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
#include "axi_bram_ctrl.h"
#include "stdio.h"
#include "xil_io.h"
////////////////////////////////////////////////
//static and public variable

////////////////////////////////////////////////
//function and note
// function inside
static uint64 get_devc_addr(
    uint8 devc
){
    uint64  addr_devc;
    switch(devc)
    {
        case DEVC_BRAM0: addr_devc = ADDR_BRAM0; break;
        case DEVC_BRAM1: addr_devc = ADDR_BRAM1; break;
        case DEVC_BRAM2: addr_devc = ADDR_BRAM2; break;
        case DEVC_BRAM3: addr_devc = ADDR_BRAM3; break;
        case DEVC_BRAM4: addr_devc = ADDR_BRAM4; break;
        case DEVC_BRAM5: addr_devc = ADDR_BRAM5; break;
        case DEVC_BRAM6: addr_devc = ADDR_BRAM6; break;
        case DEVC_BRAM7: addr_devc = ADDR_BRAM7; break;
        default: addr_devc = ADDR_BRAM0; break;
    }
    return addr_devc;
}
//function public
//exec
int write_bram(
    uint8   mode, //
    uint8   data[], //
    uint32  size, //
    uint32  init, //
    uint8   devc  //
){
    uint32  data_tmp;

    switch (mode)
    {
    case MODE_RGB888_BRAM: //RGB888 to BRAM32
    {
        for(int i = 0; i < size/3; i = i + 1)
        {
            data_tmp = data[i*3+0] << 16
                    |  data[i*3+1] << 8
                    |  data[i*3+2] << 0;
            uint64 addr = get_devc_addr(devc)+init + i * 4;
            Xil_Out32(addr,data_tmp);
        }
        break;
    }
    default:
        break;
    }
    return ERR_NO_ERR;
}
int read_bram(
    uint8   data[], //
    uint32  size, //
    uint32  init, //
    uint8   devc  //
){
    uint64 addr = get_devc_addr(devc)+init;
    for(int i = 0; i < size >> 2; i = i + 1)
    {
        uint32 tmp = Xil_In32(addr+init+i * 4);
        data[i*4+0] = tmp >> 0  & 0xff;
        data[i*4+1] = tmp >> 8  & 0xff;
        data[i*4+2] = tmp >> 16 & 0xff;
        data[i*4+3] = tmp >> 24 & 0xff;
    }
    return ERR_NO_ERR;
}
