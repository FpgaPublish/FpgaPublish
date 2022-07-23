#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ctrl = new udp_ctrl;
    ctrl->show();

    came = new camera;
    came->show();
}

MainWindow::~MainWindow()
{
    delete ui;
}

