//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 13:11:28
// Design Name:
// Module Name: udp_client.cpp
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
#include "udp_client.h"
#include "ui_udp_client.h"

udp_client::udp_client(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::udp_client)
{
    ui->setupUi(this);
    udp = new QUdpSocket;
    ui->ui_port->setValue(DEFAULT_PORT_CLIENT);
    ui->ui_addr->setText(DEFAULT_ADDR_CLIENT);
}
udp_client::~udp_client()
{
    delete ui;
}

int udp_client::writeUdp(char *data, qint16 size)
{
    //*********************************************
    //variable and number array
    //---------------------------------------------
    QString s_addr ;
    int     n_port ;
    //*********************************************
    //logic and calculate
    //---------------------------------------------
    s_addr = ui->ui_addr->text();
    n_port = ui->ui_port->value();

    addr = QHostAddress(s_addr);
    port = n_port;

    udp->writeDatagram(data,size,addr,port);
    //*********************************************
    //return result by error
    //---------------------------------------------
    return 0;

}
