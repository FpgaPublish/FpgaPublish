//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F 
// 
// Create Date: 2022/07/10 20:48:59
// Design Name: 
// Module Name: udp_ctrl
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
#include "udp_ctrl.h"


extern struct netif erver_netif ;
static struct udp_pcb *pcb      ;

static char send_buf[UDP_SEND_BUFSIZE];
#define FINISH	1
//sety the delay time
#define REPORT_INTERVAL_TIME (INTERIM_REPORT_INTERVAL * 1000)
#define END_TIME (UDP_TIME_INTERVAL * 1000)

//control the udp
void udp_ctrl(

){
//*********************************************
//parameter and constant
//---------------------------------------------
    
//*********************************************
//variable and number array
//---------------------------------------------
err_t err;
ip_addr_t remote_addr;
u32_t i;
//*********************************************
//logic and calculate
//---------------------------------------------
//get the addr and check it
err = inet_aton(UDP_SERVER_IP_ADDRESS, &remote_addr);
if(!err)
{
    xil_printf("Invalid Server IP address: %d\r\n",err);
    return;
}
//create and connect the pcb
pcb = udp_new();
if(!pcb) 
{
    xil_printf("Error in PCB creation. out of memory\r\n");
    return;
}
err = udp_connect(pcb,&remote_addr,UDP_CONN_PORT);
if(err != ERR_OK)
{
    xil_printf("udp_client: Error on udp_connect: %d\r\n", err);
    udp_remove(pcb);
    return;
}
//wait connection
usleep(10);

err = udp_bind(pcb, IP_ADDR_ANY, UDP_CONN_PORT);
if (err != ERR_OK) {
    xil_printf("UDP server: Unable to bind to port");
    xil_printf(" %d: err = %d\r\n", UDP_CONN_PORT, err);
    udp_remove(pcb);
    return;
}
//init the send buf
for (i = 0; i < UDP_SEND_BUFSIZE; i++)
{
    send_buf[i] = i;
}
//add the recv function
udp_recv(pcb, udp_loop_recv, NULL);
//wait to recv
xil_printf("UDP server: wait to recv data\r\n");
//*********************************************
//return result by error
//---------------------------------------------
    return;   //return error code
}
void print_app_header(void)
{
	xil_printf("UDP client connecting to %s on port %d\r\n",
			UDP_SERVER_IP_ADDRESS, UDP_CONN_PORT);
	xil_printf("On Host: Run $iperf -s -i %d -u\r\n\r\n",
			INTERIM_REPORT_INTERVAL);
}
void udp_loop_recv(
    void *arg,             //argumenbt
    struct udp_pcb *tpcb,  //protocol control block
    struct pbuf *p,        //recv place buf
    const ip_addr_t *addr, //from ip addr
    u16_t port             //from port
)
{
//send back
udp_sendto(tpcb, p, addr, port);
xil_printf("UDP loop feedback the data\n\r");
pbuf_free(p);
return;

}
