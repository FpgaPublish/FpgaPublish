/***************************************************
* File: demo
* Date: 11 April 2022 9:37:01 pm 
* Author: f
* Company: fpgaPublish
* Reversion:    0.01
*     Reversion 0.01 - create file
* Addition: 
****************************************************/


//********************************************
// support define
#include "../uart_driver/uart_master.h"
#include "../axi_driver/axi_driver.h"
#include "sleep.h"

//********************************************
// area variable

//********************************************
// area function list
void demo_led_on()
{
    uart_report(0,"test start");
    axi_led_config(0x12);
    sleep(20);
    axi_led_config(0x21);
    sleep(20);
    uart_report(0,"test stop");
}
//********************************************
// public function list
void demo_led() 
{
    demo_led_on();
}



