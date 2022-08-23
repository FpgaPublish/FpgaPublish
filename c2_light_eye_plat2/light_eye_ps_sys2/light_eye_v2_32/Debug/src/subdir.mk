################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/i2c_access.c \
../src/iic_phyreset.c \
../src/light_eye_main.c \
../src/platform.c \
../src/platform_mb.c \
../src/platform_zynq.c \
../src/platform_zynqmp.c \
../src/sfp.c \
../src/si5324.c \
../src/udp_perf_server.c 

OBJS += \
./src/i2c_access.o \
./src/iic_phyreset.o \
./src/light_eye_main.o \
./src/platform.o \
./src/platform_mb.o \
./src/platform_zynq.o \
./src/platform_zynqmp.o \
./src/sfp.o \
./src/si5324.o \
./src/udp_perf_server.o 

C_DEPS += \
./src/i2c_access.d \
./src/iic_phyreset.d \
./src/light_eye_main.d \
./src/platform.d \
./src/platform_mb.d \
./src/platform_zynq.d \
./src/platform_zynqmp.d \
./src/sfp.d \
./src/si5324.d \
./src/udp_perf_server.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v8 gcc compiler'
	aarch64-none-elf-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -ID:/e1_library/f2_light_eye_plat2/light_eye_ps_sys2/light_eye_v2_32/Debug/_sdk/bsp/psu_cortexa53_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


