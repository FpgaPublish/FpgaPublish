//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 20:47:39
// Design Name:
// Module Name: dudpdriv.cpp
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
//          1. path = D:/demo rather than D:/demo/
//////////////////////////////////////////////////////////////////////////////////
#include "dudpdriv.h"
#include "ui_dudpdriv.h"
#include "../MACRO.h"
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QFileDialog>
#include <QMessageBox>
#include <QTimer>

SUdpPck pck_send;
SUdpPck pck_recv;


DUdpDriv::DUdpDriv(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DUdpDriv)
{
    ui->setupUi(this);
    udp = new QUdpSocket;
    udp->bind(QHostAddress(IP_PC),PORT);
    connect(udp,SIGNAL(readyRead()),this,SLOT(udp_recv_act_ready()));
}

DUdpDriv::~DUdpDriv()
{
    delete udp;
    delete ui;
}
bool DUdpDriv::wait_signal(const char * signal, const unsigned int millisecond) //wait signal trig
{
    bool result = true;

    QEventLoop loop;
    connect(this, signal, &loop, SLOT(quit()));

    QTimer timer;
    timer.setSingleShot(true);
    connect(&timer, &QTimer::timeout, [&loop, &result]{ result = false; loop.quit();});
    timer.start(millisecond);

    loop.exec();
    timer.stop();
    return result;
}


void DUdpDriv::on_ui_send_act_clicked()
{
    QString s_txt = ui->ui_send_txt->toPlainText();
    QByteArray a_txt = s_txt.toLatin1();
    pck_send.pck_code = CODE_CMD_DEMO;
    pck_send.pck_len  = sizeof(a_txt);
    pck_send.pck_wid  = 1;
    pck_send.pck_now  = 0;
    uchar pck_xor = 0x00;
    for(uint i = 0; i < sizeof(a_txt); i++)
    {
        pck_send.pck_dat[i] = a_txt[i];
        pck_xor ^= a_txt[i];
    }
    pck_send.pck_xor = pck_xor;
    QByteArray a_buf;
    a_buf.resize(sizeof(pck_send));
    char *p_buf = a_buf.data();
    memcpy(p_buf,&pck_send,sizeof(pck_send));
    udp->writeDatagram(a_buf,QHostAddress(IP_PS),PORT);
    wait_signal("SIGNAL(recvFlg())",5);
}

void DUdpDriv::udp_recv_act_ready()
{
    if(udp->hasPendingDatagrams()) //pck just once
    {
        QByteArray a_txt;
        a_txt.resize(udp->pendingDatagramSize());
        udp->readDatagram(a_txt.data(),a_txt.size());
        memcpy(&pck_recv,(SUdpPck*)a_txt.data(),sizeof(pck_recv));
        switch(pck_recv.pck_code)
        {
        case CODE_CMD_DEMO: ui->ui_recv_txt->setText(a_txt); break;
        case CODE_BMP_FILE: recv_img_pck(ui->ui_recv_path->text()); break;
        default:             break;
        }

    }
}
void DUdpDriv::send_img_pck(QString pns)
{
    //get file
    QString dir = QDir::currentPath();
    QFileInfo info(pns);
    if(info.isFile() == 0)
    {
        pns = QFileDialog::getOpenFileName(this, tr("open bmp file"),dir,  tr("bmpfile(*.bmp)"));
        if(pns == "")
        {
            QMessageBox::warning(this,"error","no bmp file");
            return;
        }
    }
    QImage img(pns);
    img = img.convertToFormat(QImage::Format_RGB888);
    ui->ui_send_img->setPixmap(QPixmap::fromImage(img));
    //get info
    uint width  = img.width();
    uint height = img.height();
    uchar *map  = img.scanLine(0);
    pck_send.pck_code = CODE_BMP_FILE;
    pck_send.pck_len  = width;
    pck_send.pck_wid  = height * 3;
    //copy to pck
    for(uint j = 0; j < height * 3; j++) //every 960 / 3 data
    {
        uchar chk_xor = 0x00;
        //here coast 10ms and make the process slow
        for(uint i = 0; i < width; i = i + 1)
            {
                pck_send.pck_dat[i] = map[j*width + i];
                chk_xor ^= map[i + j * width];
            }
        pck_send.pck_now = j;
        pck_send.pck_xor = chk_xor;
        //send data
        QByteArray a_txt;
        a_txt.resize(sizeof(pck_send));
        char *p_txt = a_txt.data();
        memcpy(p_txt,&pck_send,sizeof(pck_send));
        udp->writeDatagram(a_txt,QHostAddress(IP_PS),PORT);
        wait_signal("SIGNAL(recvFlg())",5);
    }
}
void DUdpDriv::recv_img_pck(QString pns)
{
    emit recvFlg();
    //paint img
    if(pck_recv.pck_now == 0)
    {
        img = QImage(pck_recv.pck_len,pck_recv.pck_wid / 3,QImage::Format_RGB888);
    }
    //temp data
    uchar* data = img.bits();
    uchar chk_xor = 0x00;
    for(uint i = 0; i < pck_recv.pck_len; i = i + 1)
    {
        data[pck_recv.pck_now*pck_recv.pck_len + i] = pck_recv.pck_dat[i];
        chk_xor ^= pck_recv.pck_dat[i];
    }
    if(pck_recv.pck_now == pck_recv.pck_wid - 1)
    {
        //set path
        QString dir = QDir::currentPath();
        QFileInfo info(pns);
        if(info.isFile())
        {
            QFile fil(pns);
            fil.remove();
        }
        if(info.isFile() == 0)
        {
            pns = QFileDialog::getSaveFileName(this, tr("save bmp file"),dir,  tr("bmpfile(*.bmp)"));
            if(pns == "")
            {
                QMessageBox::warning(this,"error","no bmp file");
                return;
            }
        }
        //show imag
        QPixmap pixmap = QPixmap::fromImage(img);
        ui->ui_recv_img->setPixmap(QPixmap::fromImage(img));
        pixmap.save(pns);
    }

}




void DUdpDriv::on_ui_img_act_clicked()
{
    send_img_pck(ui->ui_send_path->text());
}

