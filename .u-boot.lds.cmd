cmd_u-boot.lds := aarch64-linux-gnu-gcc -E -Wp,-MD,./.u-boot.lds.d -D__KERNEL__ -D__UBOOT__ -D__ARM__          -fno-pic  -mstrict-align -ffunction-sections -fdata-sections -fno-common -ffixed-x18  -mgeneral-regs-only    -mbranch-protection=none -pipe -march=armv8-a+crc -D__LINUX_ARM_ARCH__=8  -I./arch/arm/mach-nf271x/include -Iinclude   -I./arch/arm/include -include ./include/linux/kconfig.h -nostdinc -isystem /usr/lib/gcc-cross/aarch64-linux-gnu/13/include -ansi -include ./include/u-boot/u-boot.lds.h -DCPUDIR=arch/arm/cpu/armv8  -D__ASSEMBLY__ -x assembler-with-cpp -std=c99 -P -o u-boot.lds arch/arm/cpu/armv8/u-boot.lds

source_u-boot.lds := arch/arm/cpu/armv8/u-boot.lds

deps_u-boot.lds := \
    $(wildcard include/config/armv8/secure/base.h) \
    $(wildcard include/config/armv8/psci.h) \
    $(wildcard include/config/armv8/psci/nr/cpus.h) \
    $(wildcard include/config/linux/kernel/image/header.h) \
  include/linux/kconfig.h \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
    $(wildcard include/config/spl/.h) \
    $(wildcard include/config/tpl/.h) \
    $(wildcard include/config/tools/.h) \
    $(wildcard include/config/tpl/build.h) \
    $(wildcard include/config/vpl/build.h) \
    $(wildcard include/config/spl/build.h) \
    $(wildcard include/config/tools/foo.h) \
    $(wildcard include/config/spl/foo.h) \
    $(wildcard include/config/tpl/foo.h) \
    $(wildcard include/config/vpl/foo.h) \
    $(wildcard include/config/option.h) \
    $(wildcard include/config/acme.h) \
    $(wildcard include/config/spl/acme.h) \
    $(wildcard include/config/tpl/acme.h) \
    $(wildcard include/config/if/enabled/int.h) \
    $(wildcard include/config/int/option.h) \
  include/u-boot/u-boot.lds.h \
  include/config.h \
  include/configs/myrpi4cp.h \
    $(wildcard include/config/show/debug/message.h) \
    $(wildcard include/config/arm64.h) \
    $(wildcard include/config/text/base.h) \
    $(wildcard include/config/cmd/dfu.h) \
    $(wildcard include/config/auto/zreladdr.h) \
    $(wildcard include/config/cmd/mmc.h) \
    $(wildcard include/config/cmd/usb.h) \
    $(wildcard include/config/cmd/pxe.h) \
    $(wildcard include/config/cmd/dhcp.h) \
  include/linux/sizes.h \
  include/linux/const.h \
  arch/arm/include/asm/arch/timer.h \
  include/config_distro_bootcmd.h \
    $(wildcard include/config/sandbox.h) \
    $(wildcard include/config/cmd/ubifs.h) \
    $(wildcard include/config/efi/loader.h) \
    $(wildcard include/config/arm.h) \
    $(wildcard include/config/x86/run/32bit.h) \
    $(wildcard include/config/x86/run/64bit.h) \
    $(wildcard include/config/arch/rv32i.h) \
    $(wildcard include/config/arch/rv64i.h) \
    $(wildcard include/config/cmd/bootefi/bootmgr.h) \
    $(wildcard include/config/sata.h) \
    $(wildcard include/config/nvme.h) \
    $(wildcard include/config/scsi.h) \
    $(wildcard include/config/ide.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/cmd/virtio.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/cmd/extension.h) \
  arch/arm/include/asm/config.h \
    $(wildcard include/config/arch/ls1021a.h) \
    $(wildcard include/config/fsl/layerscape.h) \
  include/linux/kconfig.h \
  include/config_fallbacks.h \
    $(wildcard include/config/spl/pad/to.h) \
    $(wildcard include/config/spl/max/size.h) \
  arch/arm/include/asm/psci.h \
    $(wildcard include/config/armv7/psci/nr/cpus.h) \

u-boot.lds: $(deps_u-boot.lds)

$(deps_u-boot.lds):
