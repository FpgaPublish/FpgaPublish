#ifndef CAMERA_BLCK_H
#define CAMERA_BLCK_H

#include <QDialog>
#include "camera_driv.h"
namespace Ui {
class camera_blck;
}

class camera_blck : public QDialog
{
    Q_OBJECT

public:
    explicit camera_blck(QWidget *parent = nullptr);
    ~camera_blck();

private slots:
    void on_ui_imag_clicked();

private:
    Ui::camera_blck *ui;
    camera_driv *cd;
};

#endif // CAMERA_BLCK_H
