################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/axi_blck/axi_bram_chck.c \
../src/axi_blck/axi_bram_ctrl.c \
../src/axi_blck/axi_gpio_chck.c \
../src/axi_blck/axi_gpio_ctrl.c 

OBJS += \
./src/axi_blck/axi_bram_chck.o \
./src/axi_blck/axi_bram_ctrl.o \
./src/axi_blck/axi_gpio_chck.o \
./src/axi_blck/axi_gpio_ctrl.o 

C_DEPS += \
./src/axi_blck/axi_bram_chck.d \
./src/axi_blck/axi_bram_ctrl.d \
./src/axi_blck/axi_gpio_chck.d \
./src/axi_blck/axi_gpio_ctrl.d 


# Each subdirectory must supply rules for building sources it contributes
src/axi_blck/%.o: ../src/axi_blck/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v8 gcc compiler'
	aarch64-none-elf-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -ID:/e1_library/f2_light_eye_plat2/light_eye_ps_sys3/light_eye_top_top0_0822_2226/export/light_eye_top_top0_0822_2226/sw/light_eye_top_top0_0822_2226/standalone_psu_cortexa53_0/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


