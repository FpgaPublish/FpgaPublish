#include "../MACRO.h"
struct SGpioPck{
    uint1  m_shk_gpio_valid; //0
    uint16 m_shk_gpio_smosi; //16-1
    uint16 m_shk_gpio_dmosi; //31-17
    uint1  m_shk_gpio_ready; //0
    uint16 m_shk_gpio_smiso; //16-1
    uint16 m_shk_gpio_dmiso; //31-17
};

int write_gpio(
    uint8  devc 
);
int read_gpio(
    uint8  devc 
);

int gpio_shk_gray(
    uint16 size,
    uint8  devc
);
