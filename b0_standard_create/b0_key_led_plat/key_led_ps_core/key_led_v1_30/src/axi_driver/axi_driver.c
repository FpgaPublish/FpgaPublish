/***************************************************
* File: axi_driver
* Date: 11 April 2022 9:36:29 pm 
* Author: f
* Company: fpgaPublish
* Reversion:    0.01
*     Reversion 0.01 - create file
* Addition: 
****************************************************/


#define XPAR_AXI_GPIO_0_BASEADDR 0x80000000
#define XPAR_AXI_GPIO_0_HIGHADDR 0x8000FFFF
//********************************************
// support define
#include "xil_io.h"
//********************************************
// area variable

//********************************************
// area function list

//********************************************
// public function list
void axi_led_config(int led_config)
{
    Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR,led_config);
}