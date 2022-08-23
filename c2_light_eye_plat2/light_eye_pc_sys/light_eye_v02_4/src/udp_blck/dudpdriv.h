#ifndef DUDPDRIV_H
#define DUDPDRIV_H

#include <QDialog>
#include <QUdpSocket>

namespace Ui {
class DUdpDriv;
}

class DUdpDriv : public QDialog
{
    Q_OBJECT

public:
    explicit DUdpDriv(QWidget *parent = nullptr);
    ~DUdpDriv();

private slots:
    void on_ui_send_act_clicked();
    void udp_recv_act_ready();

    void on_ui_img_act_clicked();
signals:
    void recvFlg();
private:
    Ui::DUdpDriv *ui;
    QUdpSocket *udp;
    QImage img;
    void recv_img_pck(QString pns = "");
    void send_img_pck(QString pns = "");
    bool wait_signal(const char * signal, const unsigned int millisecond);

};

#endif // DUDPDRIV_H
