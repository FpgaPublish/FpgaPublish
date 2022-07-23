#include "udp_blck.h"
#include "ui_udp_blck.h"

udp_blck::udp_blck(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::udp_blck)
{
    ui->setupUi(this);
    ud = new udp_driv;

}

udp_blck::~udp_blck()
{
    delete ui;
}

void udp_blck::on_ui_send_bmp_clicked()
{
    ud->send_bmp_file();
    ud->show();
}

