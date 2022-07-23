/********************************************************************************
** Form generated from reading UI file 'camera_driv.ui'
**
** Created by: Qt User Interface Compiler version 5.12.11
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CAMERA_DRIV_H
#define UI_CAMERA_DRIV_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QLabel>

QT_BEGIN_NAMESPACE

class Ui_camera_driv
{
public:
    QDialogButtonBox *buttonBox;
    QComboBox *ui_camera;
    QLabel *ui_video;
    QLabel *ui_imag;

    void setupUi(QDialog *camera_driv)
    {
        if (camera_driv->objectName().isEmpty())
            camera_driv->setObjectName(QString::fromUtf8("camera_driv"));
        camera_driv->resize(998, 665);
        buttonBox = new QDialogButtonBox(camera_driv);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(620, 600, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        ui_camera = new QComboBox(camera_driv);
        ui_camera->setObjectName(QString::fromUtf8("ui_camera"));
        ui_camera->setGeometry(QRect(80, 70, 89, 23));
        ui_video = new QLabel(camera_driv);
        ui_video->setObjectName(QString::fromUtf8("ui_video"));
        ui_video->setGeometry(QRect(90, 110, 601, 441));
        ui_imag = new QLabel(camera_driv);
        ui_imag->setObjectName(QString::fromUtf8("ui_imag"));
        ui_imag->setGeometry(QRect(830, 20, 161, 151));

        retranslateUi(camera_driv);
        QObject::connect(buttonBox, SIGNAL(accepted()), camera_driv, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), camera_driv, SLOT(reject()));

        QMetaObject::connectSlotsByName(camera_driv);
    } // setupUi

    void retranslateUi(QDialog *camera_driv)
    {
        camera_driv->setWindowTitle(QApplication::translate("camera_driv", "Dialog", nullptr));
        ui_video->setText(QApplication::translate("camera_driv", "video", nullptr));
        ui_imag->setText(QApplication::translate("camera_driv", "imag", nullptr));
    } // retranslateUi

};

namespace Ui {
    class camera_driv: public Ui_camera_driv {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CAMERA_DRIV_H
