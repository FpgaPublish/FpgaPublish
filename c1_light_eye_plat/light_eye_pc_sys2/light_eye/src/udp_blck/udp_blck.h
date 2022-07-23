#ifndef UDP_BLCK_H
#define UDP_BLCK_H

#include <QDialog>
#include "udp_driv.h"
namespace Ui {
class udp_blck;
}

class udp_blck : public QDialog
{
    Q_OBJECT

public:
    explicit udp_blck(QWidget *parent = nullptr);
    ~udp_blck();

private slots:
    void on_ui_send_bmp_clicked();

private:
    Ui::udp_blck *ui;
    udp_driv *ud;
};

#endif // UDP_BLCK_H
