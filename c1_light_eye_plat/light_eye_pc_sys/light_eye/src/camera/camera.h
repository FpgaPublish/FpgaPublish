#ifndef CAMERA_H
#define CAMERA_H

#include <QDialog>
#include <QCamera>
#include <QCameraViewfinder>
#include <QCameraImageCapture>


namespace Ui {
class camera;
}

class camera : public QDialog
{
    Q_OBJECT

public:
    explicit camera(QWidget *parent = nullptr);
    ~camera();
    QString face_img;
private slots:
    void capture_image();
    void display_image(int,QImage);
    void on_ui_capture_clicked();

    void on_ui_save_clicked();

private:
    Ui::camera *ui;
    QCamera * io_camera;
    QCameraViewfinder *view_finder;
    QCameraImageCapture *image_capture;
};

#endif // CAMERA_H
