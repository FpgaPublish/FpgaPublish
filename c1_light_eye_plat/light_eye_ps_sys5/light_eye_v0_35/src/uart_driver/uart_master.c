/***************************************************
* File: uart_master
* Date: 11 April 2022 9:37:15 pm 
* Author: f
* Company: fpgaPublish
* Reversion:    0.01
*     Reversion 0.01 - create file
* Addition: 
****************************************************/


//********************************************
// support define
#include "xil_printf.h"
#include "uart_master.h"
//********************************************
// area variable

//********************************************
// area function list

//********************************************
// public function list
void uart_report(int mode, char* msg)
{
    switch(mode)
    {
        case 0: xil_printf("info: %s\n",msg);
        case 1: xil_printf("info: %s\n",msg);
        case 2: xil_printf("error: %s\n",msg);
    }
}



