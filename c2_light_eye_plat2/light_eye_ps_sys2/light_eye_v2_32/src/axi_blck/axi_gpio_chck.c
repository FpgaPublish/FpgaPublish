#include "axi_gpio_chck.h"
#include "axi_gpio_ctrl.h"
#include "../MACRO.h"
extern struct SGpioPck gpio0;
void chck_gpio(
    
){
    gpio_shk_gray(1,DEVC_GPIO0); //1k gray
}
