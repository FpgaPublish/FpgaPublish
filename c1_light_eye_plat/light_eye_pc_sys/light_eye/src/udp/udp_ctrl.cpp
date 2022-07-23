//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 22:25:49
// Design Name:
// Module Name: udp_ctrl.cpp
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
#include "udp_ctrl.h"
#include "ui_udp_ctrl.h"
#include <QDebug>
udp_ctrl::udp_ctrl(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::udp_ctrl)
{
    ui->setupUi(this);
    client = new udp_client;
    server = new udp_server;
    connect(server,SIGNAL(readyRead()),this,SLOT(on_udp_recv_data()));
}

udp_ctrl::~udp_ctrl()
{
    delete ui;
}

int udp_ctrl::clientShow()
{
    //*********************************************
    //variable and number array
    //---------------------------------------------
    char data[1048];

    //*********************************************
    //logic and calculate
    //---------------------------------------------
    for(int i = 0; i < 1048; i = i +1)
    {
        data[i] = i & 0xff;
    }
    client->writeUdp(data,1024);
    //*********************************************
    //windows and dialog
    //---------------------------------------------
    client->show();
    //*********************************************
    //return result by error
    //---------------------------------------------
    return 0;
}

int udp_ctrl::serverShow()
{
    //*********************************************
    //variable and number array
    //---------------------------------------------
    char data[1048];
    //*********************************************
    //logic and calculate
    //---------------------------------------------
    server->readUdp(data,1024);
    //*********************************************
    //windows and dialog
    //---------------------------------------------
    qDebug() << data;
    ui->ui_server_data->setText(QByteArray(data).toHex());
    //*********************************************
    //return result by error
    //---------------------------------------------
    return 0;

}

void udp_ctrl::on_ui_client_clicked()
{
    clientShow();
}

void udp_ctrl::on_udp_recv_data()
{
    serverShow();
}
void udp_ctrl::on_ui_server_clicked()
{
    server->show();
}

