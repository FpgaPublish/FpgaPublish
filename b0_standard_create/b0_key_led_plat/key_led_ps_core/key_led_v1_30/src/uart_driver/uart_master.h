/**********************************************
* File: uart_master
* Date: 11 April 2022 9:37:29 pm 
* Author: f
* Company: fpgaPublish
* Reversion:    0.01
*     Reversion 0.01 - create file
* Addition: 
**********************************************/


//********************************************
// type define

//********************************************
// public variable

//********************************************
// function list
/*
 * funtion parameter :  mode - if(0) info; if(1) warn; if(2) error;
                        msg - show message value 
 * funtion return    :  
 * funtion describe  :  report current status
 * funtion version   : 0.01
 *            Revision 0.01 - create
 */
void uart_report(int mode , char* msg);


