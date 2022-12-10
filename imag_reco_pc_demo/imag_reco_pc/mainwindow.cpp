//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 23:27:03
// Design Name:
// Module Name: mainwindow.cpp
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
//////////////////////////////////////////////////////////////////////////////////
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QTimer>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    // =====================================================
    // mesu bar param
    // --------------------------------------------
    // net param
    u_udp_subs = new udp_subs;
    connect(u_udp_subs,&udp_subs::spd_trig,this,&MainWindow::net_spd_driv);
    // =====================================================
    // display init
    // --------------------------------------------
    // welcome

    // =====================================================
    // win init
    // --------------------------------------------
    // info init
    //ui->ui_info_log->setText("[0x11000000]info: Welcome to Imag Recognize\n\r");
    info_blck(CODE_WELCOME,"info","Welcome to Imag Recognize");
    //list to feedback info
    connect(u_udp_subs,&udp_subs::info_trig,this,&MainWindow::info_blck);
    // --------------------------------------------
    // widget init
    ui->ui_display->clear();
    u_welcome_mdle = new welcome_mdle;
    ui->ui_display->insertTab(0,u_welcome_mdle,"welcome");

}

MainWindow::~MainWindow()
{
    delete u_udp_subs;
    delete u_welcome_mdle;
    delete ui;
}

bool MainWindow::wait_signals(const char * signal, const unsigned int millisecond)
{
    bool result = true;

    QEventLoop loop;
    connect(this, signal, &loop, SLOT(quit()));

    QTimer timer;
    timer.setSingleShot(true);
    connect(&timer, &QTimer::timeout, [&loop, &result]{ result = false; loop.quit();});
    timer.start(millisecond);

    loop.exec();
    timer.stop();
    return result;
}

void MainWindow::on_actionnet_triggered()
{
    //open net param win
    u_udp_subs->setWindowTitle("u_udp_subs");
    u_udp_subs->show();
}

void MainWindow::info_blck(quint32 n_code, QString s_info, QString s_text)
{
    //printf info
    QString s_code = QString("%1").arg(n_code,4,16,QChar('0'));
    QString s_show = ui->ui_info_log->toPlainText() + "[0x" + s_code +"]" + s_info + ": " +s_text +"\n\r";
    ui->ui_info_log->setText(s_show);
}

void MainWindow::net_spd_driv(float net_spd)
{
    int n_spd = net_spd;
    ui->ui_net_spd->setMaximum(500);
    ui->ui_net_spd->setMinimum(0);
    ui->ui_net_spd->setValue(n_spd);
    QString s_spd = QString("net spd is %1 pkg every second\n\r").arg(net_spd);
    info_blck(CODE_WELCOME,"info",s_spd);
}


void MainWindow::on_ui_info_log_textChanged()
{
    //move cursor to info end
    ui->ui_info_log->moveCursor(QTextCursor::End);
}


void MainWindow::on_ui_net_clicked()
{
    u_udp_subs->send_udp_spd();

}

