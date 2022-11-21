/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.12.11
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QProgressBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QTextBrowser>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QToolBox>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionnet;
    QWidget *ui_win;
    QHBoxLayout *horizontalLayout_4;
    QVBoxLayout *ui_imag_reco;
    QHBoxLayout *ui_ctrl;
    QVBoxLayout *ui_ctrl_flow;
    QToolBox *ui_flow;
    QWidget *ui_flow_cnt;
    QPushButton *ui_uart;
    QPushButton *ui_net;
    QProgressBar *ui_net_spd;
    QProgressBar *ui_uart_spd;
    QWidget *ui_flow_load;
    QPushButton *ui_file_load;
    QWidget *ui_flow_solve;
    QPushButton *ui_signal;
    QPushButton *ui_file_save;
    QWidget *ui_imag_result;
    QPushButton *ui_chart;
    QPushButton *ui_imag;
    QHBoxLayout *ui_show;
    QVBoxLayout *ui_show_1;
    QGridLayout *ui_show_2;
    QTabWidget *ui_display;
    QWidget *tab;
    QWidget *tab_2;
    QHBoxLayout *ui_info;
    QTextBrowser *ui_info_log;
    QMenuBar *menubar;
    QMenu *menufile;
    QMenu *menumode;
    QMenu *menuconnect;
    QMenu *menuparameter;
    QMenu *menuhelp;
    QStatusBar *statusbar;
    QToolBar *toolBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(859, 620);
        actionnet = new QAction(MainWindow);
        actionnet->setObjectName(QString::fromUtf8("actionnet"));
        ui_win = new QWidget(MainWindow);
        ui_win->setObjectName(QString::fromUtf8("ui_win"));
        horizontalLayout_4 = new QHBoxLayout(ui_win);
        horizontalLayout_4->setObjectName(QString::fromUtf8("horizontalLayout_4"));
        ui_imag_reco = new QVBoxLayout();
        ui_imag_reco->setSpacing(7);
        ui_imag_reco->setObjectName(QString::fromUtf8("ui_imag_reco"));
        ui_imag_reco->setSizeConstraint(QLayout::SetDefaultConstraint);
        ui_imag_reco->setContentsMargins(1, 1, 1, 1);
        ui_ctrl = new QHBoxLayout();
        ui_ctrl->setSpacing(5);
        ui_ctrl->setObjectName(QString::fromUtf8("ui_ctrl"));
        ui_ctrl_flow = new QVBoxLayout();
        ui_ctrl_flow->setObjectName(QString::fromUtf8("ui_ctrl_flow"));
        ui_flow = new QToolBox(ui_win);
        ui_flow->setObjectName(QString::fromUtf8("ui_flow"));
        ui_flow->setLayoutDirection(Qt::LeftToRight);
        ui_flow_cnt = new QWidget();
        ui_flow_cnt->setObjectName(QString::fromUtf8("ui_flow_cnt"));
        ui_flow_cnt->setGeometry(QRect(0, 0, 164, 309));
        ui_uart = new QPushButton(ui_flow_cnt);
        ui_uart->setObjectName(QString::fromUtf8("ui_uart"));
        ui_uart->setGeometry(QRect(10, 10, 89, 24));
        ui_net = new QPushButton(ui_flow_cnt);
        ui_net->setObjectName(QString::fromUtf8("ui_net"));
        ui_net->setGeometry(QRect(10, 40, 89, 24));
        ui_net_spd = new QProgressBar(ui_flow_cnt);
        ui_net_spd->setObjectName(QString::fromUtf8("ui_net_spd"));
        ui_net_spd->setGeometry(QRect(110, 40, 51, 23));
        ui_net_spd->setMaximum(1000);
        ui_net_spd->setValue(0);
        ui_uart_spd = new QProgressBar(ui_flow_cnt);
        ui_uart_spd->setObjectName(QString::fromUtf8("ui_uart_spd"));
        ui_uart_spd->setGeometry(QRect(110, 10, 51, 23));
        ui_uart_spd->setValue(0);
        ui_flow->addItem(ui_flow_cnt, QString::fromUtf8("\351\200\232\344\277\241\345\215\217\350\256\256"));
        ui_flow_load = new QWidget();
        ui_flow_load->setObjectName(QString::fromUtf8("ui_flow_load"));
        ui_flow_load->setGeometry(QRect(0, 0, 164, 309));
        ui_file_load = new QPushButton(ui_flow_load);
        ui_file_load->setObjectName(QString::fromUtf8("ui_file_load"));
        ui_file_load->setGeometry(QRect(20, 50, 89, 24));
        ui_flow->addItem(ui_flow_load, QString::fromUtf8("\346\225\260\346\215\256\345\212\240\350\275\275"));
        ui_flow_solve = new QWidget();
        ui_flow_solve->setObjectName(QString::fromUtf8("ui_flow_solve"));
        ui_flow_solve->setGeometry(QRect(0, 0, 164, 309));
        ui_signal = new QPushButton(ui_flow_solve);
        ui_signal->setObjectName(QString::fromUtf8("ui_signal"));
        ui_signal->setGeometry(QRect(20, 20, 89, 24));
        ui_file_save = new QPushButton(ui_flow_solve);
        ui_file_save->setObjectName(QString::fromUtf8("ui_file_save"));
        ui_file_save->setGeometry(QRect(20, 60, 89, 24));
        ui_flow->addItem(ui_flow_solve, QString::fromUtf8("\346\225\260\346\215\256\345\244\204\347\220\206"));
        ui_imag_result = new QWidget();
        ui_imag_result->setObjectName(QString::fromUtf8("ui_imag_result"));
        ui_imag_result->setGeometry(QRect(0, 0, 164, 309));
        ui_chart = new QPushButton(ui_imag_result);
        ui_chart->setObjectName(QString::fromUtf8("ui_chart"));
        ui_chart->setGeometry(QRect(20, 20, 89, 24));
        ui_imag = new QPushButton(ui_imag_result);
        ui_imag->setObjectName(QString::fromUtf8("ui_imag"));
        ui_imag->setGeometry(QRect(20, 60, 89, 24));
        ui_flow->addItem(ui_imag_result, QString::fromUtf8("\346\225\260\346\215\256\346\230\276\347\244\272"));

        ui_ctrl_flow->addWidget(ui_flow);


        ui_ctrl->addLayout(ui_ctrl_flow);

        ui_show = new QHBoxLayout();
        ui_show->setObjectName(QString::fromUtf8("ui_show"));
        ui_show_1 = new QVBoxLayout();
        ui_show_1->setObjectName(QString::fromUtf8("ui_show_1"));
        ui_show_2 = new QGridLayout();
        ui_show_2->setObjectName(QString::fromUtf8("ui_show_2"));
        ui_display = new QTabWidget(ui_win);
        ui_display->setObjectName(QString::fromUtf8("ui_display"));
        tab = new QWidget();
        tab->setObjectName(QString::fromUtf8("tab"));
        ui_display->addTab(tab, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QString::fromUtf8("tab_2"));
        ui_display->addTab(tab_2, QString());

        ui_show_2->addWidget(ui_display, 2, 0, 1, 1);


        ui_show_1->addLayout(ui_show_2);


        ui_show->addLayout(ui_show_1);


        ui_ctrl->addLayout(ui_show);

        ui_ctrl->setStretch(0, 1);
        ui_ctrl->setStretch(1, 4);

        ui_imag_reco->addLayout(ui_ctrl);

        ui_info = new QHBoxLayout();
        ui_info->setObjectName(QString::fromUtf8("ui_info"));
        ui_info_log = new QTextBrowser(ui_win);
        ui_info_log->setObjectName(QString::fromUtf8("ui_info_log"));

        ui_info->addWidget(ui_info_log);


        ui_imag_reco->addLayout(ui_info);

        ui_imag_reco->setStretch(0, 5);
        ui_imag_reco->setStretch(1, 1);

        horizontalLayout_4->addLayout(ui_imag_reco);

        MainWindow->setCentralWidget(ui_win);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 859, 25));
        menufile = new QMenu(menubar);
        menufile->setObjectName(QString::fromUtf8("menufile"));
        menumode = new QMenu(menubar);
        menumode->setObjectName(QString::fromUtf8("menumode"));
        menuconnect = new QMenu(menubar);
        menuconnect->setObjectName(QString::fromUtf8("menuconnect"));
        menuparameter = new QMenu(menubar);
        menuparameter->setObjectName(QString::fromUtf8("menuparameter"));
        menuhelp = new QMenu(menubar);
        menuhelp->setObjectName(QString::fromUtf8("menuhelp"));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);
        toolBar = new QToolBar(MainWindow);
        toolBar->setObjectName(QString::fromUtf8("toolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, toolBar);

        menubar->addAction(menufile->menuAction());
        menubar->addAction(menumode->menuAction());
        menubar->addAction(menuconnect->menuAction());
        menubar->addAction(menuparameter->menuAction());
        menubar->addAction(menuhelp->menuAction());
        menuparameter->addAction(actionnet);

        retranslateUi(MainWindow);

        ui_flow->setCurrentIndex(0);
        ui_display->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", nullptr));
        actionnet->setText(QApplication::translate("MainWindow", "\347\275\221\345\217\243", nullptr));
        ui_uart->setText(QApplication::translate("MainWindow", "\344\270\262\345\217\243\351\200\232\344\277\241", nullptr));
        ui_net->setText(QApplication::translate("MainWindow", "\347\275\221\345\217\243\351\200\232\344\277\241", nullptr));
        ui_flow->setItemText(ui_flow->indexOf(ui_flow_cnt), QApplication::translate("MainWindow", "\351\200\232\344\277\241\345\215\217\350\256\256", nullptr));
        ui_file_load->setText(QApplication::translate("MainWindow", "\346\226\207\344\273\266\345\212\240\350\275\275", nullptr));
        ui_flow->setItemText(ui_flow->indexOf(ui_flow_load), QApplication::translate("MainWindow", "\346\225\260\346\215\256\345\212\240\350\275\275", nullptr));
        ui_signal->setText(QApplication::translate("MainWindow", "\344\277\241\345\217\267\350\275\254\345\255\230", nullptr));
        ui_file_save->setText(QApplication::translate("MainWindow", "\346\226\207\344\273\266\350\275\254\345\255\230", nullptr));
        ui_flow->setItemText(ui_flow->indexOf(ui_flow_solve), QApplication::translate("MainWindow", "\346\225\260\346\215\256\345\244\204\347\220\206", nullptr));
        ui_chart->setText(QApplication::translate("MainWindow", "\345\235\220\346\240\207\346\230\276\347\244\272", nullptr));
        ui_imag->setText(QApplication::translate("MainWindow", "\345\233\276\345\203\217\346\230\276\347\244\272", nullptr));
        ui_flow->setItemText(ui_flow->indexOf(ui_imag_result), QApplication::translate("MainWindow", "\346\225\260\346\215\256\346\230\276\347\244\272", nullptr));
        ui_display->setTabText(ui_display->indexOf(tab), QApplication::translate("MainWindow", "Tab 1", nullptr));
        ui_display->setTabText(ui_display->indexOf(tab_2), QApplication::translate("MainWindow", "Tab 2", nullptr));
        menufile->setTitle(QApplication::translate("MainWindow", "\346\226\207\344\273\266", nullptr));
        menumode->setTitle(QApplication::translate("MainWindow", "\346\250\241\345\274\217", nullptr));
        menuconnect->setTitle(QApplication::translate("MainWindow", "\351\223\276\346\216\245", nullptr));
        menuparameter->setTitle(QApplication::translate("MainWindow", "\345\217\202\346\225\260", nullptr));
        menuhelp->setTitle(QApplication::translate("MainWindow", "\345\270\256\345\212\251", nullptr));
        toolBar->setWindowTitle(QApplication::translate("MainWindow", "toolBar", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
