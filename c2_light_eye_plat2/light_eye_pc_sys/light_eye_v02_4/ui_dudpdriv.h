/********************************************************************************
** Form generated from reading UI file 'dudpdriv.ui'
**
** Created by: Qt User Interface Compiler version 5.12.11
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DUDPDRIV_H
#define UI_DUDPDRIV_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextEdit>

QT_BEGIN_NAMESPACE

class Ui_DUdpDriv
{
public:
    QDialogButtonBox *buttonBox;
    QTextEdit *ui_send_txt;
    QTextEdit *ui_recv_txt;
    QPushButton *ui_send_act;
    QLineEdit *ui_send_path;
    QLabel *ui_send_img;
    QLabel *ui_recv_img;
    QPushButton *ui_img_act;
    QLineEdit *ui_recv_path;

    void setupUi(QDialog *DUdpDriv)
    {
        if (DUdpDriv->objectName().isEmpty())
            DUdpDriv->setObjectName(QString::fromUtf8("DUdpDriv"));
        DUdpDriv->resize(785, 558);
        buttonBox = new QDialogButtonBox(DUdpDriv);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(560, 500, 201, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        ui_send_txt = new QTextEdit(DUdpDriv);
        ui_send_txt->setObjectName(QString::fromUtf8("ui_send_txt"));
        ui_send_txt->setGeometry(QRect(40, 520, 281, 21));
        ui_recv_txt = new QTextEdit(DUdpDriv);
        ui_recv_txt->setObjectName(QString::fromUtf8("ui_recv_txt"));
        ui_recv_txt->setGeometry(QRect(40, 480, 281, 31));
        ui_send_act = new QPushButton(DUdpDriv);
        ui_send_act->setObjectName(QString::fromUtf8("ui_send_act"));
        ui_send_act->setGeometry(QRect(330, 520, 89, 24));
        ui_send_path = new QLineEdit(DUdpDriv);
        ui_send_path->setObjectName(QString::fromUtf8("ui_send_path"));
        ui_send_path->setGeometry(QRect(40, 80, 301, 23));
        ui_send_img = new QLabel(DUdpDriv);
        ui_send_img->setObjectName(QString::fromUtf8("ui_send_img"));
        ui_send_img->setGeometry(QRect(50, 120, 281, 301));
        ui_recv_img = new QLabel(DUdpDriv);
        ui_recv_img->setObjectName(QString::fromUtf8("ui_recv_img"));
        ui_recv_img->setGeometry(QRect(400, 120, 341, 301));
        ui_img_act = new QPushButton(DUdpDriv);
        ui_img_act->setObjectName(QString::fromUtf8("ui_img_act"));
        ui_img_act->setGeometry(QRect(320, 40, 89, 24));
        ui_recv_path = new QLineEdit(DUdpDriv);
        ui_recv_path->setObjectName(QString::fromUtf8("ui_recv_path"));
        ui_recv_path->setGeometry(QRect(380, 80, 301, 23));

        retranslateUi(DUdpDriv);
        QObject::connect(buttonBox, SIGNAL(accepted()), DUdpDriv, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DUdpDriv, SLOT(reject()));

        QMetaObject::connectSlotsByName(DUdpDriv);
    } // setupUi

    void retranslateUi(QDialog *DUdpDriv)
    {
        DUdpDriv->setWindowTitle(QApplication::translate("DUdpDriv", "Dialog", nullptr));
        ui_send_act->setText(QApplication::translate("DUdpDriv", "\345\217\221\351\200\201", nullptr));
        ui_send_path->setText(QApplication::translate("DUdpDriv", "D:\\e1_library\\f2_light_eye_plat2\\light_eye_pc_sys\\light_eye_v02_4.dat\\demo.bmp", nullptr));
        ui_send_img->setText(QApplication::translate("DUdpDriv", "\345\233\276\347\211\207\345\217\221\351\200\201", nullptr));
        ui_recv_img->setText(QApplication::translate("DUdpDriv", "\345\233\276\347\211\207\346\216\245\346\224\266", nullptr));
        ui_img_act->setText(QApplication::translate("DUdpDriv", "\345\217\221\351\200\201\345\233\276\347\211\207", nullptr));
        ui_recv_path->setText(QApplication::translate("DUdpDriv", "D:\\e1_library\\f2_light_eye_plat2\\light_eye_pc_sys\\light_eye_v02_4.dat\\demo3.bmp", nullptr));
    } // retranslateUi

};

namespace Ui {
    class DUdpDriv: public Ui_DUdpDriv {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DUDPDRIV_H
