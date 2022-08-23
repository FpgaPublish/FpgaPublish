//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/08/18 21:58:35
// Design Name: 
// Module Name: axi_gpio_ctrl
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
#include "axi_gpio_ctrl.h"
#include "xil_io.h"
#include "xil_printf.h"
////////////////////////////////////////////////
//static and public variable
static struct SGpioPck gpio0;
////////////////////////////////////////////////
//function and note
static uint64 get_devc_addr(
    uint8 devc
){
    uint64  addr_devc;
    switch(devc)
    {
        case DEVC_GPIO0: addr_devc = ADDR_GPIO0; break;
        default: addr_devc = ADDR_GPIO0; break;
    }
    return addr_devc;
}
//
int gpio_shk_gray(
    uint16 size,
    uint8  devc
){
    //ensure device is idle
    uint16 cnt = 0;
    uint16 dly = 10000;
    while(gpio0.m_shk_gpio_ready || cnt > dly)
    {
        gpio0.m_shk_gpio_valid = 0;
        write_gpio(devc);
        xil_printf("info: cnt = %d\n\r",cnt);
        cnt = cnt + 1;
        read_gpio(devc);
    }
    if(cnt > dly) 
    {
        return ERR_OUT_TIME;
    }
    gpio0.m_shk_gpio_valid = 1;
    gpio0.m_shk_gpio_smosi = size;
    write_gpio(devc);
    gpio0.m_shk_gpio_ready = 0;
    while(!gpio0.m_shk_gpio_ready)
    {
        read_gpio(devc);
    }
    gpio0.m_shk_gpio_valid = 0;
    write_gpio(devc);
    //
    return ERR_NO_ERR;
}

//
int write_gpio(
    uint8  devc 
){
    uint32 data = gpio0.m_shk_gpio_dmosi << 17
                | gpio0.m_shk_gpio_smosi << 1
                | gpio0.m_shk_gpio_valid << 0 ;
    uint64 addr = get_devc_addr(devc);
    Xil_Out32(addr,data);
    return ERR_NO_ERR;
}
int read_gpio(
    uint8  devc 
){
    uint64 addr = get_devc_addr(devc);
    uint64 data = Xil_In32(addr+ADDR_GPIO_OFFSET);
    gpio0.m_shk_gpio_ready = (uint1)data & 0x1;
    gpio0.m_shk_gpio_smiso = (uint16)data >> 1;
    gpio0.m_shk_gpio_dmiso = (uint16)data >> 17;
    return ERR_NO_ERR;
}
