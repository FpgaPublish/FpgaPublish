#include "axi_gpio_chck.h"
#include "axi_gpio_ctrl.h"
#include "../MACRO.h"
#include "axi_bram_ctrl.h"
#include "xil_printf.h"
extern struct SGpioPck gpio0;
void chck_gpio(
    
){
    uint8 rgb[9];
    uint8 rgb2[12];
    uint8 rgb3[12];

    for(uint8 i = 0; i < 9; i = i + 1)
    {
        rgb[i] = i;
    }
    write_bram(0,rgb,9,0,DEVC_BRAM0);
    read_bram(rgb3,12,0,DEVC_BRAM0);
    gpio_shk_gray(1,DEVC_GPIO0); //1k gray
    read_bram(rgb2,12,0,DEVC_BRAM0);
    xil_printf("info: ray once\n\r");
}
