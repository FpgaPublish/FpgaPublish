//////////////////////////////////////////////////////////////////////////////////
// Company: Fpga Publish
// Engineer: F
//
// Create Date: 2022 11:49:59
// Design Name:
// Module Name: udp_driv.h
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
//          2. QT       += network
//////////////////////////////////////////////////////////////////////////////////
#ifndef UDP_DRIV_H
#define UDP_DRIV_H

#include <QDialog>
#include <QUdpSocket>
namespace Ui {
class udp_driv;
}

class udp_driv : public QDialog
{
    Q_OBJECT

public:
    explicit udp_driv(QWidget *parent = nullptr);
    ~udp_driv();

private:
    Ui::udp_driv *ui;
    QUdpSocket   *us;
    QString      addr_master;
    quint16      port_master;
    QString      addr_slaver;
    quint16      port_slaver;

    int bind_udp_set(
            QString addr_m = "192.168.1.10",
            quint16 port_m = 8080,
            QString addr_s = "192.168.1.11",
            quint16 port_s = 8080
            );
    int read_udp_set();

public:
    int send_bmp_file(
            QString pns = "" //bmp file path and name and suffix
            );
private slots:
    void on_ui_set_clicked();
    void on_ui_unset_clicked();
};

#endif // UDP_DRIV_H
