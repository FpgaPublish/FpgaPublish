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

    void setupUi(QDialog *DUdpDriv)
    {
        if (DUdpDriv->objectName().isEmpty())
            DUdpDriv->setObjectName(QString::fromUtf8("DUdpDriv"));
        DUdpDriv->resize(785, 558);
        buttonBox = new QDialogButtonBox(DUdpDriv);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(410, 500, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        ui_send_txt = new QTextEdit(DUdpDriv);
        ui_send_txt->setObjectName(QString::fromUtf8("ui_send_txt"));
        ui_send_txt->setGeometry(QRect(50, 70, 281, 361));
        ui_recv_txt = new QTextEdit(DUdpDriv);
        ui_recv_txt->setObjectName(QString::fromUtf8("ui_recv_txt"));
        ui_recv_txt->setGeometry(QRect(410, 70, 281, 361));
        ui_send_act = new QPushButton(DUdpDriv);
        ui_send_act->setObjectName(QString::fromUtf8("ui_send_act"));
        ui_send_act->setGeometry(QRect(140, 450, 89, 24));

        retranslateUi(DUdpDriv);
        QObject::connect(buttonBox, SIGNAL(accepted()), DUdpDriv, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), DUdpDriv, SLOT(reject()));

        QMetaObject::connectSlotsByName(DUdpDriv);
    } // setupUi

    void retranslateUi(QDialog *DUdpDriv)
    {
        DUdpDriv->setWindowTitle(QApplication::translate("DUdpDriv", "Dialog", nullptr));
        ui_send_act->setText(QApplication::translate("DUdpDriv", "\345\217\221\351\200\201", nullptr));
    } // retranslateUi

};

namespace Ui {
    class DUdpDriv: public Ui_DUdpDriv {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DUDPDRIV_H
