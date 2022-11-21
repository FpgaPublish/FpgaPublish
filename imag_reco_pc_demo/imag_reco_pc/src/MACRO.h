#ifndef MACRO_H
#define MACRO_H

#include <QMetaType>
// ========================================
// device list code
#define DEV_PC 1
#define DEV_PS 2
#define DEV_PL 3

// ========================================
//add code value
//PC(1) code
#define CODE_WELCOME  0x11000000
#define CODE_NET_SET  0x11000001

//PC(1) and PS(2) code
#define CODE_HELLO_PS 0x12210000
#define CODE_BMP_FILE 0x12210001

//PC(1) and PL(3) code


//add struct
struct SUdpPck{
    quint32 pkg_code;      //class code
    quint32 pkg_len ;      //one pkg length
    quint32 pkg_wid ;      //current pkg width
    char    pkg_dat [960]; //pkg data
    quint32 pkg_xor ;      //pkg xor
};
Q_DECLARE_METATYPE(SUdpPck)


//add error macro
#define ERR_NO_ERR        0
#define ERR_TYPE_MATCH    1
#define ERR_NULL_VARIABLE 2

#endif // MACRO_H
