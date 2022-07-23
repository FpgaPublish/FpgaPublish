#ifndef UDP_SERVER_H
#define UDP_SERVER_H

#include <QDialog>
#include <QUdpSocket>

#define DEFAULT_PORT_SERVER 8080
#define DEFAULT_ADDR_SERVER "192.168.1.20"
namespace Ui {
class udp_server;
}

class udp_server : public QDialog
{
    Q_OBJECT

public:
    explicit udp_server(QWidget *parent = nullptr);
    ~udp_server();

private:
    Ui::udp_server *ui;
    QUdpSocket *udp;
    QHostAddress *addr;
    quint16 *port;
public:
    int readUdp(
            char *data, //get data
            qint16 size //set data size
            );
signals:
    void readyRead();
};

#endif // UDP_SERVER_H
