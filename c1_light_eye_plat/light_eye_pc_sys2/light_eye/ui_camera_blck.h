/********************************************************************************
** Form generated from reading UI file 'camera_blck.ui'
**
** Created by: Qt User Interface Compiler version 5.12.11
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CAMERA_BLCK_H
#define UI_CAMERA_BLCK_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QPushButton>

QT_BEGIN_NAMESPACE

class Ui_camera_blck
{
public:
    QDialogButtonBox *buttonBox;
    QPushButton *ui_imag;

    void setupUi(QDialog *camera_blck)
    {
        if (camera_blck->objectName().isEmpty())
            camera_blck->setObjectName(QString::fromUtf8("camera_blck"));
        camera_blck->resize(400, 300);
        buttonBox = new QDialogButtonBox(camera_blck);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(30, 240, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        ui_imag = new QPushButton(camera_blck);
        ui_imag->setObjectName(QString::fromUtf8("ui_imag"));
        ui_imag->setGeometry(QRect(80, 50, 89, 24));

        retranslateUi(camera_blck);
        QObject::connect(buttonBox, SIGNAL(accepted()), camera_blck, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), camera_blck, SLOT(reject()));

        QMetaObject::connectSlotsByName(camera_blck);
    } // setupUi

    void retranslateUi(QDialog *camera_blck)
    {
        camera_blck->setWindowTitle(QApplication::translate("camera_blck", "Dialog", nullptr));
        ui_imag->setText(QApplication::translate("camera_blck", "\350\216\267\345\217\226\345\233\276\347\211\207", nullptr));
    } // retranslateUi

};

namespace Ui {
    class camera_blck: public Ui_camera_blck {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CAMERA_BLCK_H
