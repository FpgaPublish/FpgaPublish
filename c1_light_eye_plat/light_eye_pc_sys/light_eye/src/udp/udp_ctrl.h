#ifndef UDP_CTRL_H
#define UDP_CTRL_H

#include <QDialog>
#include "udp_client.h"
#include "udp_server.h"
//

namespace Ui {
class udp_ctrl;
}

class udp_ctrl : public QDialog
{
    Q_OBJECT

public:
    explicit udp_ctrl(QWidget *parent = nullptr);
    ~udp_ctrl();

private:
    Ui::udp_ctrl *ui;
    udp_client *client;
    udp_server *server;
public:
    int clientShow();
    int serverShow();

private slots:
    void on_ui_client_clicked();
    void on_udp_recv_data();
    void on_ui_server_clicked();
};

#endif // UDP_CTRL_H
