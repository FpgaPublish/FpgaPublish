#ifndef MACRO_H
#define MACRO_H
#include "xparameters.h"

#define CODE_CMD_DEMO 0
#define CODE_BMP_FILE 1

//add type
typedef unsigned int   uint32;
typedef unsigned char  uint8;
typedef unsigned short uint16;
typedef unsigned long  uint64;
typedef unsigned char  uint1;
//add ip
#define IP_PS "192.168.120.10"
#define PORT 5001

//device code
#define DEVC_BRAM0 0x00 
#define DEVC_BRAM1 0x01
#define DEVC_BRAM2 0x02 
#define DEVC_BRAM3 0x03 
#define DEVC_BRAM4 0x04 
#define DEVC_BRAM5 0x05 
#define DEVC_BRAM6 0x06 
#define DEVC_BRAM7 0x07 

#define DEVC_GPIO0 0xff
//set BRAM size
#define SIZE_BRAM 0x10000 //64K

//device address in hardware
#define ADDR_BRAM0 XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR
#define ADDR_BRAM1 XPAR_AXI_BRAM_CTRL_1_S_AXI_BASEADDR
#define ADDR_BRAM2 XPAR_AXI_BRAM_CTRL_2_S_AXI_BASEADDR
#define ADDR_BRAM3 XPAR_AXI_BRAM_CTRL_3_S_AXI_BASEADDR
#define ADDR_BRAM4 XPAR_AXI_BRAM_CTRL_4_S_AXI_BASEADDR
#define ADDR_BRAM5 XPAR_AXI_BRAM_CTRL_5_S_AXI_BASEADDR
#define ADDR_BRAM6 XPAR_AXI_BRAM_CTRL_6_S_AXI_BASEADDR
#define ADDR_BRAM7 XPAR_AXI_BRAM_CTRL_7_S_AXI_BASEADDR

#define ADDR_GPIO0 XPAR_AXI_GPIO_0_BASEADDR
#define ADDR_GPIO_OFFSET 0x0008
//error info
#define ERR_NO_ERR   0
#define ERR_NOT_CASE 1
#define ERR_OUT_TIME 2
#endif
