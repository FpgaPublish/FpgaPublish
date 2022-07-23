//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 11:49:18
// Design Name:
// Module Name: camera_driv.h
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
//          2. QT       += multimedia multimediawidgets
//////////////////////////////////////////////////////////////////////////////////
#ifndef CAMERA_DRIV_H
#define CAMERA_DRIV_H

#include <QDialog>
#include <QCamera>
#include <QCameraViewfinder>
#include <QCameraImageCapture>
#include <QDir>
#include <QCameraInfo>

namespace Ui {
class camera_driv;
}

class camera_driv : public QDialog
{
    Q_OBJECT

public:
    explicit camera_driv(QWidget *parent = nullptr);
    ~camera_driv();

private:
    Ui::camera_driv *ui;
    QCamera * ca;
    QList<QCameraInfo> cas;
    QCameraViewfinder *vw;
    QCameraImageCapture *ic;
    bool WaitForSignalFinished3(const char * signal, const unsigned int millisecond);
private slots:
    void en_display_image(int,QImage);
public:
    int get_ca_imag(
            QString name = "imag/demo",         //imag file name
            QString path = QDir::currentPath()  //imag file path
            );
signals:
    void fg_imag_save();
};

#endif // CAMERA_DRIV_H
