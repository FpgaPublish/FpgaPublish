/********************************************************************************
** Form generated from reading UI file 'udp_blck.ui'
**
** Created by: Qt User Interface Compiler version 5.12.11
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_UDP_BLCK_H
#define UI_UDP_BLCK_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QPushButton>

QT_BEGIN_NAMESPACE

class Ui_udp_blck
{
public:
    QDialogButtonBox *buttonBox;
    QPushButton *ui_send_bmp;

    void setupUi(QDialog *udp_blck)
    {
        if (udp_blck->objectName().isEmpty())
            udp_blck->setObjectName(QString::fromUtf8("udp_blck"));
        udp_blck->resize(697, 578);
        buttonBox = new QDialogButtonBox(udp_blck);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(320, 520, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        ui_send_bmp = new QPushButton(udp_blck);
        ui_send_bmp->setObjectName(QString::fromUtf8("ui_send_bmp"));
        ui_send_bmp->setGeometry(QRect(510, 350, 89, 24));

        retranslateUi(udp_blck);
        QObject::connect(buttonBox, SIGNAL(accepted()), udp_blck, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), udp_blck, SLOT(reject()));

        QMetaObject::connectSlotsByName(udp_blck);
    } // setupUi

    void retranslateUi(QDialog *udp_blck)
    {
        udp_blck->setWindowTitle(QApplication::translate("udp_blck", "Dialog", nullptr));
        ui_send_bmp->setText(QApplication::translate("udp_blck", "\345\217\221\351\200\201BMP\346\226\207\344\273\266", nullptr));
    } // retranslateUi

};

namespace Ui {
    class udp_blck: public Ui_udp_blck {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_UDP_BLCK_H
