################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/key_led_blck/subdir.mk
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
key_led_v2_31.elf.size \


# All Target
all: key_led_v2_31.elf secondary-outputs

# Tool invocations
key_led_v2_31.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM v8 gcc linker'
	aarch64-none-elf-gcc -Wl,-T -Wl,../src/lscript.ld -LD:/e1_library/e1_key_led_plat2/key_led_ps_sys1/key_led_v2_22_wrapper_top0/export/key_led_v2_22_wrapper_top0/sw/key_led_v2_22_wrapper_top0/standalone_domain/bsplib/lib -o "key_led_v2_31.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

key_led_v2_31.elf.size: key_led_v2_31.elf
	@echo 'Invoking: ARM v8 Print Size'
	aarch64-none-elf-size key_led_v2_31.elf  |tee "key_led_v2_31.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) key_led_v2_31.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents

-include ../makefile.targets
