/*
 * Copyright (C) 2017 - 2019 Xilinx, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 */

/** Connection handle for a UDP Server session */

#include "udp_perf_server.h"
#include "MACRO.h"
#include "./axi_blck/axi_bram_ctrl.h"
extern struct netif server_netif;
static struct udp_pcb *pcb;
/* Report interval in ms */
#define REPORT_INTERVAL_TIME (INTERIM_REPORT_INTERVAL * 1000)

void print_app_header(void)
{
    xil_printf("UDP server listening on port %d\r\n",
            UDP_CONN_PORT);
    xil_printf("On Host: Run $iperf -c %s -i %d -t 300 -u -b <bandwidth>\r\n",
            inet_ntoa(server_netif.ip_addr),
            INTERIM_REPORT_INTERVAL);

}

/** Receive data on a udp session */
static void udp_recv_perf_traffic(void *arg, struct udp_pcb *tpcb,
        struct pbuf *p, const ip_addr_t *addr, u16_t port)
{
    struct SUdpPck udp;
    uint8 rgb_tmp[udp.pck_len/3*4];
    memcpy((char *)&udp,(p->payload),p->len);
    xil_printf("info: code receive %x\n\r",udp.pck_code);
    //decode the command
    switch (udp.pck_code)
    {
    case CODE_CMD_DEMO:
        udp_sendto(tpcb, p, addr, port);
        break;
    case CODE_BMP_FILE:
        write_bram(MODE_RGB888_BRAM,&udp.pck_dat,udp.pck_len,0,DEVC_BRAM0);
        //gray ctrl

        //
        read_bram(rgb_tmp,udp.pck_len/3*4,0,DEVC_BRAM0);
        for(int i = 0; i < udp.pck_len/3; i = i + 1)
        {
            udp.pck_dat[i*3+0] = rgb_tmp[i*4+3];
            udp.pck_dat[i*3+1] = rgb_tmp[i*4+3];
            udp.pck_dat[i*3+2] = rgb_tmp[i*4+3];
        }
        udp_sendto(tpcb, p, addr, port);
        break;
    default:
        break;
    }
    //back the code
    udp_sendto(tpcb, p, addr, port);
    pbuf_free(p);
    return;
}
void start_application(void)
{
    err_t err;

    /* Create Server PCB */
    pcb = udp_new();
    if (!pcb) {
        xil_printf("UDP server: Error creating PCB. Out of Memory\r\n");
        return;
    }

    err = udp_bind(pcb, IP_ADDR_ANY, UDP_CONN_PORT);
    if (err != ERR_OK) {
        xil_printf("UDP server: Unable to bind to port");
        xil_printf(" %d: err = %d\r\n", UDP_CONN_PORT, err);
        udp_remove(pcb);
        return;
    }

    /* specify callback to use for incoming connections */
    udp_recv(pcb, udp_recv_perf_traffic, NULL);

    return;
}
