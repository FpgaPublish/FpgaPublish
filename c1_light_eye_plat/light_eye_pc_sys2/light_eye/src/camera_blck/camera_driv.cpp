//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 11:41:33
// Design Name:
// Module Name: camera_driv.cpp
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
#include "camera_driv.h"
#include "ui_camera_driv.h"
#include "../MACRO.h"
#include <QTimer>
camera_driv::camera_driv(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::camera_driv)
{
    ui->setupUi(this);

    //get the cameras device
    cas = QCameraInfo::availableCameras();
    qDebug() <<cas.size();
    for(int i = 0; i < cas.size(); i=i+1)
    {
        ui->ui_camera->addItem(cas[i].description());
    }
    //init new camera
    ca = new QCamera(cas[ui->ui_camera->currentIndex()],this);
    vw = new QCameraViewfinder(ui->ui_video);
    ic = new QCameraImageCapture(ca);

    //init camera mode
    ic->setCaptureDestination(QCameraImageCapture::CaptureToFile);
    ca->setCaptureMode(QCamera::CaptureStillImage);
    ca->setCaptureMode(QCamera::CaptureMode::CaptureViewfinder);
    ca->setViewfinder(vw);
    ca->start();

    //display imag
    QDir dir;
    dir.mkpath(QDir::currentPath()+"/imag");
    connect(ic,SIGNAL(imageCaptured(int,QImage)),this,SLOT(en_display_image(int,QImage)));
}

camera_driv::~camera_driv()
{
    delete ui;
}

void camera_driv::en_display_image(int, QImage image)
{
    ui->ui_imag->setPixmap(QPixmap::fromImage(image));
    emit fg_imag_save();
}
bool camera_driv::WaitForSignalFinished3(const char * signal, const unsigned int millisecond)
{
    bool result = true;

    QEventLoop loop;
    connect(this, signal, &loop, SLOT(quit()));

    QTimer timer;
    timer.setSingleShot(true);
    connect(&timer, &QTimer::timeout, [&loop, &result]{ result = false;  loop.quit();});
    timer.start(millisecond);

    loop.exec();
    timer.stop();
    return result;
}

int camera_driv::get_ca_imag(QString name, QString path)
{
    //*********************************************
    //variable and number array
    //---------------------------------------------
    int err = 0;
    //*********************************************
    //logic and calculate
    //---------------------------------------------
    //capture jpg
    ca->searchAndLock();
    ic->capture(path+"/"+name+".jpg");
    qDebug() << path+"/"+name+".jpg is saved";
    //release
    ca->unlock();
    //conver bmp
    WaitForSignalFinished3("SIGNAL(fg_imag_save())",100);
    QImage img(path+"/"+name+".jpg");
    QPixmap pixmap = QPixmap::fromImage(img);
    pixmap.save(path+"/"+name+".bmp");
    qDebug() << path+"/"+name+".bmp is saved";
    //*********************************************
    //windows and dialog
    //---------------------------------------------


    //*********************************************
    //return result by error
    //---------------------------------------------
    return err;
}

