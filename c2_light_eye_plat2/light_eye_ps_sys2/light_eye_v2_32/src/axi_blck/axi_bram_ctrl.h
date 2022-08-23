#include "../MACRO.h"

#define MODE_RGB888_BRAM 0

int write_bram(
    uint8   mode,
    uint8  *data,
    uint32  size,
    uint32  init,
    uint8   devc
);
int read_bram(
    uint8  *data,
    uint32  size,
    uint32  init,
    uint8   devc
);
