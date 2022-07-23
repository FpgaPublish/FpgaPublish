#include "camera.h"
#include "ui_camera.h"

camera::camera(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::camera)
{
    ui->setupUi(this);
    this->setWindowFlags(Qt::CustomizeWindowHint | Qt::WindowCloseButtonHint);
    io_camera = new QCamera(this);
    view_finder = new QCameraViewfinder(ui->ui_video);
    image_capture = new QCameraImageCapture(io_camera);
    image_capture->setCaptureDestination(QCameraImageCapture::CaptureToFile);
    io_camera->setCaptureMode(QCamera::CaptureStillImage);
    io_camera->setCaptureMode(QCamera::CaptureMode::CaptureViewfinder);
    io_camera->setViewfinder(view_finder);
    io_camera->start();
    connect(image_capture,SIGNAL(imageCaptured(int,QImage)),this,SLOT(display_image(int,QImage)));
}

camera::~camera()
{
    delete ui;
}

void camera::capture_image()
{
    image_capture->capture();
}

void camera::display_image(int , QImage image)
{
    ui->ui_imag->setPixmap(QPixmap::fromImage(image));
}

void camera::on_ui_capture_clicked()
{
    capture_image();
}


void camera::on_ui_save_clicked()
{
    const QPixmap* pixmap = ui->ui_imag->pixmap();
    if(pixmap)
    {
        pixmap->save("demo.bmp");
        face_img = "demo.bmp";
        //close();
    }
}

