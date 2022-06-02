################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/key_led_blck/key_led_ctrl.c \
../src/key_led_blck/key_led_driv.c 

OBJS += \
./src/key_led_blck/key_led_ctrl.o \
./src/key_led_blck/key_led_driv.o 

C_DEPS += \
./src/key_led_blck/key_led_ctrl.d \
./src/key_led_blck/key_led_driv.d 


# Each subdirectory must supply rules for building sources it contributes
src/key_led_blck/%.o: ../src/key_led_blck/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v8 gcc compiler'
	aarch64-none-elf-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -ID:/e1_library/e1_key_led_plat2/key_led_ps_sys1/key_led_v2_22_wrapper_top0/export/key_led_v2_22_wrapper_top0/sw/key_led_v2_22_wrapper_top0/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


