//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 20:54:58
// Design Name:
// Module Name: main.cpp
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
//
//////////////////////////////////////////////////////////////////////////////////
#include "mainwindow.h"
#include "./src/camera_blck/camera_blck.h"
#include <QApplication>
#include "./src/MACRO.h"
#include "./src/udp_blck/udp_blck.h"
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    qRegisterMetaType<s_bmp_file>("s_bmp_file");
    //open camera
    //camera_blck cb;
    //cb.show();
    udp_blck ub;
    ub.show();
    return a.exec();
}
