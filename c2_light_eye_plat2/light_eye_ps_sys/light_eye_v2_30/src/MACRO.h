#define CODE_CMD_DEMO 0
#define CODE_BMP_FILE 1


//add type
typedef unsigned int  uint32;
typedef unsigned char uint8;
//add ip
#define IP_PS "192.168.120.10"
#define PORT 5001

struct SUdpPck{
    uint32 pck_code;
    uint32 pck_len ;     //height
    uint32 pck_wid ;     //width
    uint32 pck_now ;
    uint8  pck_dat[960]; //data
    uint32 pck_xor;      //xor
};
