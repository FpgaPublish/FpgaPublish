#include "mainwindow.h"

#include <QApplication>
#include "./src/MACRO.h"
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    //w.show();
    qRegisterMetaType<SUdpPck>("SUdpPck");
    return a.exec();
}
