################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
light_eye_v2_30.elf.size \


# All Target
all: light_eye_v2_30.elf secondary-outputs

# Tool invocations
light_eye_v2_30.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM v8 gcc linker'
	aarch64-none-elf-gcc -Wl,-T -Wl,../src/lscript.ld -LD:/e1_library/f2_light_eye_plat2/light_eye_ps_sys/key_led_v2_22_wrapper_top0/export/key_led_v2_22_wrapper_top0/sw/key_led_v2_22_wrapper_top0/standalone_psu_cortexa53_0/bsplib/lib -o "light_eye_v2_30.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

light_eye_v2_30.elf.size: light_eye_v2_30.elf
	@echo 'Invoking: ARM v8 Print Size'
	aarch64-none-elf-size light_eye_v2_30.elf  |tee "light_eye_v2_30.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) light_eye_v2_30.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents

-include ../makefile.targets
