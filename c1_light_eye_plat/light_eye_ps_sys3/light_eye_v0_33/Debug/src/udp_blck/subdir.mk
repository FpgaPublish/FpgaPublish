################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/udp_blck/udp_ctrl.c 

OBJS += \
./src/udp_blck/udp_ctrl.o 

C_DEPS += \
./src/udp_blck/udp_ctrl.d 


# Each subdirectory must supply rules for building sources it contributes
src/udp_blck/%.o: ../src/udp_blck/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v8 gcc compiler'
	aarch64-none-elf-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -ID:/e1_library/f1_light_eye_plat/light_eye_ps_sys3/key_led_v2_22_wrapper_top0/export/key_led_v2_22_wrapper_top0/sw/key_led_v2_22_wrapper_top0/standalone_psu_cortexa53_0/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


