//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 23:21:00
// Design Name:
// Module Name: udp_driv.cpp
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//          1. master is PC and slaver is ARM or other hardware
// Dependencies:
//
// Revision: 0.01
// Revision 0.01 - File Created
// Additional Comments:
//          1. path = D:/demo rather than D:/demo/
//////////////////////////////////////////////////////////////////////////////////
#include "udp_driv.h"
#include "ui_udp_driv.h"
#include <QFileInfo>
#include <QFileDialog>
#include <QDir>
#include "../MACRO.h"
#include <QDebug>
#include <QMessageBox>
udp_driv::udp_driv(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::udp_driv)
{
    ui->setupUi(this);
    us = new QUdpSocket;
    bind_udp_set(); //init udp

}

udp_driv::~udp_driv()
{
    delete ui;
}

int udp_driv::bind_udp_set(QString addr_m, quint16 port_m, QString addr_s, quint16 port_s)
{
    //*********************************************
    //variable and number array
    //---------------------------------------------
    int err = 0;
    //*********************************************
    //logic and calculate
    //---------------------------------------------
    us->abort();
    int ret = us->bind(QHostAddress(addr_m),port_m);
    if(ret != 0)
    {
        err = ret;
        QMessageBox::critical(this,"socket","err:"+QString::number(err));
    }
    //set public variable
    addr_master = addr_m;
    addr_slaver = addr_s;
    port_master = port_m;
    port_slaver = port_s;

    //*********************************************
    //windows and dialog
    //---------------------------------------------
    ui->ui_ip_m  ->setText(addr_m);
    ui->ui_ip_s  ->setText(addr_s);
    ui->ui_port_m->setValue(port_m);
    ui->ui_port_s->setValue(port_s);

    //*********************************************
    //return result by error
    //---------------------------------------------
    return err;
}

int udp_driv::read_udp_set()
{
    //*********************************************
    //variable and number array
    //---------------------------------------------
    int err = 0;
    //*********************************************
    //logic and calculate
    //---------------------------------------------

    //*********************************************
    //windows and dialog
    //---------------------------------------------
    ui->ui_ip_m  ->setText (addr_master);
    ui->ui_ip_s  ->setText (addr_slaver);
    ui->ui_port_m->setValue(port_master);
    ui->ui_port_s->setValue(port_slaver);

    //*********************************************
    //return result by error
    //---------------------------------------------
    return err;

}



int udp_driv::send_bmp_file(QString pns)
{
    //*********************************************
    //variable and number array
    //---------------------------------------------
    int err = 0;
    QString cdir = QDir::currentPath();
    s_bmp_file bmp;
    //*********************************************
    //logic and calculate
    //---------------------------------------------
    //ensure pns is valid
    QFileInfo fil_info(pns);
    if(fil_info.isFile() == 0)
    {
        pns = QFileDialog::getOpenFileName(this, tr("open bmp file"),cdir,  tr("bmpfile(*.bmp)"));
        if(pns == "")
        {
            err = ERR_NULL_VARIABLE;
            qDebug() << "err: no file pns is init";
            return err;
        }
    }
    //get bmp info
    QImage img(pns);
    uint width = img.width();
    uint height = img.height();
    ui->ui_img->setPixmap(QPixmap::fromImage(img));
    //init data
    uchar *map = img.scanLine(0);
    bmp.pck_code = CODE_BMP_FILE;
    bmp.pck_len  = width;
    bmp.dat_num  = height;
    bmp.chk_end[0] = 0x11;
    bmp.chk_end[0] = 0x22;
    bmp.chk_end[0] = 0x33;

    //read one line data
    uchar xo = 0x00;
    for(uint j = 0; j < height; j++)
    {
        for(uint i = 0; i < width; i = i + 1)
        {
            bmp.dat_val[i] = map[i + j*width];
            xo ^= map[i + j*width];
        }
        bmp.chk_xor = xo;
        //send data to udp
        QByteArray ba_img;
        ba_img.resize(sizeof(s_bmp_file));
        char *cp_img = ba_img.data();
        memcpy(cp_img,&bmp,sizeof(s_bmp_file));
        qint64 send_len = us->writeDatagram(ba_img,QHostAddress(addr_slaver),port_slaver);
        qDebug() << send_len;
    }
    //
    //*********************************************
    //windows and dialog
    //---------------------------------------------

    //*********************************************
    //return result by error
    //---------------------------------------------
    return err;

}

//ui function
void udp_driv::on_ui_set_clicked()
{

    bind_udp_set(
                ui->ui_ip_m  ->text(),
                ui->ui_port_m->value(),
                ui->ui_ip_s  ->text(),
                ui->ui_port_s->value());
}


void udp_driv::on_ui_unset_clicked()
{
    read_udp_set();
}

