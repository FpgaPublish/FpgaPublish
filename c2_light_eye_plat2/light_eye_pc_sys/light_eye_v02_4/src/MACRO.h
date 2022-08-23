#ifndef MACRO_H
#define MACRO_H

#include <QMetaType>


//add macro value
//#define ERR_NO_ERR 0
//#define ERR_TYPE_MATCH 1
//#define ERR_NULL_VARIABLE 2

//add code value
#define CODE_CMD_DEMO 0
#define CODE_BMP_FILE 1
//set UDP info
#define IP_PS "192.168.120.10"
#define IP_PC "192.168.120.11"
#define PORT 5001

//add struct
struct SUdpPck{
    quint32 pck_code;
    quint32 pck_len ;  //height
    quint32 pck_wid ;  //width
    quint32 pck_now ;
    uchar pck_dat[960]; //data
    quint32   pck_xor; //xor
};

#endif // MACRO_H
