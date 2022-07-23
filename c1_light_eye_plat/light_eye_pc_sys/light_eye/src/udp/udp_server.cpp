//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 23:39:39
// Design Name:
// Module Name: udp_server.cpp
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
#include "udp_server.h"
#include "ui_udp_server.h"
#include "udp_macro.h"
udp_server::udp_server(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::udp_server)
{
    ui->setupUi(this);
    udp = new QUdpSocket;
    ui->ui_port->setValue(DEFAULT_PORT_SERVER);
    ui->ui_addr->setText(DEFAULT_ADDR_SERVER);
    connect(udp,SIGNAL(readyRead()),this,SIGNAL(readyRead()));
}

udp_server::~udp_server()
{
    delete ui;
}

int udp_server::readUdp(char *data, qint16 size)
{
    //*********************************************
    //variable and number array
    //---------------------------------------------
    int err;
    QString s_addr;
    int n_port = 0;
    int n_size_recv;
    //*********************************************
    //logic and calculate
    //---------------------------------------------
    s_addr = ui->ui_addr->text();
    n_port = ui->ui_port->value();
    udp->abort();
    udp->bind(*addr,*port);
    *addr = QHostAddress(s_addr);
    *port = n_port;
    if(udp->hasPendingDatagrams() == 1)
    {
        n_size_recv = udp->pendingDatagramSize();
        if(n_size_recv > size)
        {
            udp->readDatagram(data,size,addr,port);
            err = SUCCEED;
        }
        else
        {
            size = n_size_recv;
            udp->readDatagram(data,size,addr,port);
            err = WAR_OUT_RANGE;
        }
    }
    else
    {
        err = ERR_NO_DATA;
    }

    //*********************************************
    //windows and dialog
    //---------------------------------------------


    //*********************************************
    //return result by error
    //---------------------------------------------
    return err;

}
