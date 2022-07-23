/********************************************************************************
** Form generated from reading UI file 'udp_driv.ui'
**
** Created by: Qt User Interface Compiler version 5.12.11
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_UDP_DRIV_H
#define UI_UDP_DRIV_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QDialogButtonBox>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QProgressBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_udp_driv
{
public:
    QDialogButtonBox *buttonBox;
    QLabel *ui_img;
    QWidget *gridLayoutWidget;
    QGridLayout *gridLayout;
    QLabel *label_2;
    QLabel *label_3;
    QLabel *label;
    QLabel *label_4;
    QLabel *label_5;
    QProgressBar *ui_spd_recv;
    QSpinBox *ui_port_m;
    QSpinBox *ui_port_s;
    QLineEdit *ui_ip_m;
    QLineEdit *ui_ip_s;
    QPushButton *ui_unset;
    QPushButton *ui_set;

    void setupUi(QDialog *udp_driv)
    {
        if (udp_driv->objectName().isEmpty())
            udp_driv->setObjectName(QString::fromUtf8("udp_driv"));
        udp_driv->resize(1124, 614);
        buttonBox = new QDialogButtonBox(udp_driv);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(710, 540, 341, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        ui_img = new QLabel(udp_driv);
        ui_img->setObjectName(QString::fromUtf8("ui_img"));
        ui_img->setGeometry(QRect(60, 50, 401, 401));
        gridLayoutWidget = new QWidget(udp_driv);
        gridLayoutWidget->setObjectName(QString::fromUtf8("gridLayoutWidget"));
        gridLayoutWidget->setGeometry(QRect(650, 320, 401, 109));
        gridLayout = new QGridLayout(gridLayoutWidget);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        label_2 = new QLabel(gridLayoutWidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        gridLayout->addWidget(label_2, 0, 1, 1, 1);

        label_3 = new QLabel(gridLayoutWidget);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        gridLayout->addWidget(label_3, 0, 2, 1, 1);

        label = new QLabel(gridLayoutWidget);
        label->setObjectName(QString::fromUtf8("label"));

        gridLayout->addWidget(label, 0, 0, 1, 1);

        label_4 = new QLabel(gridLayoutWidget);
        label_4->setObjectName(QString::fromUtf8("label_4"));

        gridLayout->addWidget(label_4, 1, 0, 1, 1);

        label_5 = new QLabel(gridLayoutWidget);
        label_5->setObjectName(QString::fromUtf8("label_5"));

        gridLayout->addWidget(label_5, 2, 0, 1, 1);

        ui_spd_recv = new QProgressBar(gridLayoutWidget);
        ui_spd_recv->setObjectName(QString::fromUtf8("ui_spd_recv"));
        ui_spd_recv->setMaximum(100000);
        ui_spd_recv->setValue(0);

        gridLayout->addWidget(ui_spd_recv, 3, 0, 1, 1);

        ui_port_m = new QSpinBox(gridLayoutWidget);
        ui_port_m->setObjectName(QString::fromUtf8("ui_port_m"));
        ui_port_m->setMaximum(10000);

        gridLayout->addWidget(ui_port_m, 2, 1, 1, 1);

        ui_port_s = new QSpinBox(gridLayoutWidget);
        ui_port_s->setObjectName(QString::fromUtf8("ui_port_s"));
        ui_port_s->setMaximum(10000);

        gridLayout->addWidget(ui_port_s, 2, 2, 1, 1);

        ui_ip_m = new QLineEdit(gridLayoutWidget);
        ui_ip_m->setObjectName(QString::fromUtf8("ui_ip_m"));

        gridLayout->addWidget(ui_ip_m, 1, 1, 1, 1);

        ui_ip_s = new QLineEdit(gridLayoutWidget);
        ui_ip_s->setObjectName(QString::fromUtf8("ui_ip_s"));

        gridLayout->addWidget(ui_ip_s, 1, 2, 1, 1);

        ui_unset = new QPushButton(gridLayoutWidget);
        ui_unset->setObjectName(QString::fromUtf8("ui_unset"));

        gridLayout->addWidget(ui_unset, 3, 1, 1, 1);

        ui_set = new QPushButton(gridLayoutWidget);
        ui_set->setObjectName(QString::fromUtf8("ui_set"));

        gridLayout->addWidget(ui_set, 3, 2, 1, 1);


        retranslateUi(udp_driv);
        QObject::connect(buttonBox, SIGNAL(accepted()), udp_driv, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), udp_driv, SLOT(reject()));

        QMetaObject::connectSlotsByName(udp_driv);
    } // setupUi

    void retranslateUi(QDialog *udp_driv)
    {
        udp_driv->setWindowTitle(QApplication::translate("udp_driv", "Dialog", nullptr));
        ui_img->setText(QApplication::translate("udp_driv", "imag", nullptr));
        label_2->setText(QApplication::translate("udp_driv", "PC\344\270\273\346\234\272", nullptr));
        label_3->setText(QApplication::translate("udp_driv", "\350\276\271\347\274\230\344\273\216\346\234\272", nullptr));
        label->setText(QApplication::translate("udp_driv", "\347\275\221\347\273\234\351\205\215\347\275\256", nullptr));
        label_4->setText(QApplication::translate("udp_driv", "IP", nullptr));
        label_5->setText(QApplication::translate("udp_driv", "PORT", nullptr));
        ui_unset->setText(QApplication::translate("udp_driv", "\350\257\273\345\217\226\351\205\215\347\275\256", nullptr));
        ui_set->setText(QApplication::translate("udp_driv", "\344\270\213\350\275\275\351\205\215\347\275\256", nullptr));
    } // retranslateUi

};

namespace Ui {
    class udp_driv: public Ui_udp_driv {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_UDP_DRIV_H
