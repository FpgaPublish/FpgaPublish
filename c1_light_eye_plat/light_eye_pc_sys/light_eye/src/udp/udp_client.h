#ifndef UDP_CLIENT_H
#define UDP_CLIENT_H

#include <QDialog>
#include <QUdpSocket>
//macro
#define DEFAULT_PORT_CLIENT 8080
#define DEFAULT_ADDR_CLIENT "192.168.1.20"
namespace Ui {
class udp_client;
}

class udp_client : public QDialog
{
    Q_OBJECT

public:
    explicit udp_client(QWidget *parent = nullptr);
    ~udp_client();

private:
    Ui::udp_client *ui;
    QUdpSocket *udp;
    QHostAddress addr;
    quint16 port;
public:
    int writeUdp(
            char        *data, //data to send
            qint16      size  //data size
            );
};

#endif // UDP_CLIENT_H
