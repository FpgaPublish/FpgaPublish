#ifndef MACRO_H
#define MACRO_H

#include <QMetaType>

//add macro
#define ERR_NO_ERR 0
#define ERR_TYPE_MATCH 1
#define ERR_NULL_VARIABLE 2

//add code value
#define CODE_BMP_FILE 1

//add struct
struct s_bmp_file{
    quint32 pck_code;
    quint32 pck_len; //height
    quint32 dat_num; //width
    char dat_val[960]; //data
    char chk_xor; //xor
    char chk_end[3];
};
Q_DECLARE_METATYPE(s_bmp_file)

#endif // MACRO_H
