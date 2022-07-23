#include "camera_blck.h"
#include "ui_camera_blck.h"

camera_blck::camera_blck(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::camera_blck)
{
    ui->setupUi(this);
    cd = new camera_driv;
    cd->show();
}

camera_blck::~camera_blck()
{
    delete ui;
}


void camera_blck::on_ui_imag_clicked()
{
    cd->get_ca_imag();
}

