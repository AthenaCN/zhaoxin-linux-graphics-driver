savedcmd_src/cbios/Hw/Chx001/CBiosVCP_chx.o := gcc -Wp,-MMD,src/cbios/Hw/Chx001/.CBiosVCP_chx.o.d -nostdinc -I/usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include -I/usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include/generated -I/usr/src/kernels/7.2.7-200.fc44.x86_64/include -I/usr/src/kernels/7.2.7-200.fc44.x86_64/include -I/usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include/uapi -I/usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include/generated/uapi -I/usr/src/kernels/7.2.7-200.fc44.x86_64/include/uapi -I/usr/src/kernels/7.2.7-200.fc44.x86_64/include/generated/uapi -include /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler-version.h -include /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/kconfig.h -include /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler_types.h -D__KERNEL__ -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=gnu11 -fms-extensions -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a -fcf-protection=branch -fno-jump-tables -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -march=x86-64 -mtune=generic -mno-red-zone -mcmodel=kernel -mstack-protector-guard-reg=gs -mstack-protector-guard-symbol=__ref_stack_chk_guard -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -mharden-sls=all -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -ftrivial-auto-var-init=zero -fzero-init-padding-bits=all -fno-stack-clash-protection -fdiagnostics-show-context=2 -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -fno-inline-functions-called-once -fmin-function-alignment=16 -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-type-limits -Wno-dangling-pointer -Wvla-larger-than=1 -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wno-array-bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src -Wall -fno-strict-aliasing -Wno-undef -Wno-unused -Wno-missing-braces -Wno-missing-attributes -Wno-overflow -Wno-missing-prototypes -Wno-missing-declarations -Werror -DZX_PCIE_BUS -DNEW_ZXFB -D__LINUX__ -O2 -fno-strict-aliasing -DZX_TRACE_EVENT=1 -DDRM_VERSION_CODE=LINUX_VERSION_CODE -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Callback -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor/DSIPanel -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor/EDPPanel -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Display -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Init -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Util  -fsanitize=bounds-strict -fsanitize=shift    -DMODULE  -DKBUILD_BASENAME='"CBiosVCP_chx"' -DKBUILD_MODNAME='"zx"' -D__KBUILD_MODNAME=zx -c -o src/cbios/Hw/Chx001/CBiosVCP_chx.o src/cbios/Hw/Chx001/CBiosVCP_chx.c  

source_src/cbios/Hw/Chx001/CBiosVCP_chx.o := src/cbios/Hw/Chx001/CBiosVCP_chx.c

deps_src/cbios/Hw/Chx001/CBiosVCP_chx.o := \
  /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_HAS_SANE_FUNCTION_ALIGNMENT) \
    $(wildcard include/config/X86_64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/LD_DEAD_CODE_DATA_ELIMINATION) \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/CC_HAS_ASSUME) \
    $(wildcard include/config/CC_HAS_COUNTED_BY) \
    $(wildcard include/config/FORTIFY_SOURCE) \
    $(wildcard include/config/UBSAN_BOUNDS) \
    $(wildcard include/config/CC_HAS_COUNTED_BY_PTR) \
    $(wildcard include/config/CC_HAS_MULTIDIMENSIONAL_NONSTRING) \
    $(wildcard include/config/CFI) \
    $(wildcard include/config/ARCH_USES_CFI_GENERIC_LLVM_PASS) \
    $(wildcard include/config/CC_HAS_BROKEN_COUNTED_BY_REF) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler-context-analysis.h \
  /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler_attributes.h \
  /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler-gcc.h \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
    $(wildcard include/config/CC_HAS_TYPEOF_UNQUAL) \
  /usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include/asm/percpu_types.h \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/CC_HAS_NAMED_AS) \
    $(wildcard include/config/USE_X86_SEG_SUPPORT) \
  /usr/src/kernels/7.2.7-200.fc44.x86_64/include/asm-generic/percpu_types.h \
  src/cbios/Hw/Chx001/CBios_chx.h \
  src/cbios/Hw/Chx001/../../Device/CBiosChipShare.h \
  src/cbios/Hw/Chx001/../../Device/CBiosTypes.h \
  src/cbios/Hw/Chx001/../../Device/../CBios.h \
  src/cbios/Hw/Chx001/../../Device/CBiosShare.h \
  src/cbios/Hw/Chx001/../../Device/CBIOSVER.H \
  src/cbios/Hw/Chx001/../../Device/CBiosReg.h \
  src/cbios/Hw/Chx001/../../Device/../Callback/CBiosCallbacks.h \
  src/cbios/Hw/Chx001/../../Device/../Callback/../Device/CBiosShare.h \
  src/cbios/Hw/Chx001/../../Device/../Display/CBiosDisplayManager.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/CBiosDeviceShare.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/CBiosShare.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/../Display/CBiosMode.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/../Util/CBiosEDID.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Port/CBiosDSI.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Port/../Monitor/DSIPanel/CBiosDSIPanel.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Port/../Monitor/DSIPanel/../../CBiosShare.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Port/../Monitor/DSIPanel/../../../Callback/CBiosCallbacks.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Port/../Monitor/DSIPanel/../../../Hw/HwCallback/CBiosCallbacksHw.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Port/../Monitor/DSIPanel/../../../Hw/HwCallback/../../Device/CBiosShare.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/../Display/CBiosPathManager.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/../Display/../Device/CBiosShare.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Monitor/CBiosEDPPanel.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Monitor/../CBiosShare.h \
  src/cbios/Hw/Chx001/../../Device/../Display/../Device/Monitor/../../Display/CBiosPathManager.h \
  src/cbios/Hw/Chx001/../../Device/../Display/CBiosPathManager.h \
  src/cbios/Hw/Chx001/../../Device/../Util/CBiosEDID.h \
  src/cbios/Hw/Chx001/../../Device/CBiosDevice.h \
  src/cbios/Hw/Chx001/../../Device/CBiosDeviceShare.h \
  src/cbios/Hw/Chx001/../../Device/Port/CBiosDVO.h \
  src/cbios/Hw/Chx001/../../Device/Port/../CBiosDeviceShare.h \
  src/cbios/Hw/Chx001/../../Device/Monitor/CBiosHDMIMonitor.h \
  src/cbios/Hw/Chx001/../../Device/Monitor/../CBiosDeviceShare.h \
  src/cbios/Hw/Chx001/../../Device/Monitor/CBiosDPMonitor.h \
  src/cbios/Hw/Chx001/../../Device/CBiosCompile.h \
  src/cbios/Hw/Chx001/../../Device/Port/CBiosDSI.h \
  src/cbios/Hw/Chx001/../../Device/Port/CBiosCRT.h \
  src/cbios/Hw/Chx001/../../Device/Port/../Monitor/CBiosCRTMonitor.h \
  src/cbios/Hw/Chx001/../../Device/Port/../Monitor/../../Display/CBiosDisplayManager.h \
  src/cbios/Hw/Chx001/../../Device/Port/../Monitor/../CBiosDeviceShare.h \
  src/cbios/Hw/Chx001/../../Device/Port/CBiosDP.h \
  src/cbios/Hw/Chx001/../../Device/Port/../Monitor/CBiosDPMonitor.h \
  src/cbios/Hw/Chx001/../../Device/Port/../Monitor/CBiosHDMIMonitor.h \
  src/cbios/Hw/Chx001/../../Device/Port/../../Hw/HwBlock/CBiosPHY_DP.h \
  src/cbios/Hw/Chx001/../../Device/Port/../../Hw/HwBlock/../../Device/CBiosDeviceShare.h \
  src/cbios/Hw/Chx001/../../Device/../Hw/HwInterface/CBiosHwInterface.h \
  src/cbios/Hw/Chx001/../../Device/../Hw/HwInterface/../CBiosChipFunc.h \
  src/cbios/Hw/Chx001/../../Device/../Hw/HwInterface/../../CBios.h \
  src/cbios/Hw/Chx001/../../Device/../Hw/HwInterface/../../Device/CBiosChipShare.h \
  src/cbios/Hw/Chx001/../../Device/../Hw/HwInterface/../../Display/CBiosDisplayManager.h \
  src/cbios/Hw/Chx001/../../Device/../Hw/HwBlock/CBiosDIU_CSC.h \
  src/cbios/Hw/Chx001/../CBiosHwShare.h \
  src/cbios/Hw/Chx001/../Register/BIU_CR_C_BUS_registers.h \
  src/cbios/Hw/Chx001/../Register/BIU_HDA_registers.h \
  src/cbios/Hw/Chx001/../Register/BIU_MM_registers.h \
  src/cbios/Hw/Chx001/../Register/BIU_TSR_registers.h \
  src/cbios/Hw/Chx001/../Register/BIU_VCP_registers.h \
  src/cbios/Hw/Chx001/../Register/DIU_CR_registers.h \
  src/cbios/Hw/Chx001/../Register/DIU_MM_registers.h \
  src/cbios/Hw/Chx001/../Register/DIU_SR_registers.h \
  src/cbios/Hw/Chx001/../Register/DIU_vga_registers.h \
  src/cbios/Hw/Chx001/../Register/Monitor/CBiosDPCDRegister.h \
  src/cbios/Hw/Chx001/../HwUtil/CBiosUtilHw.h \
  src/cbios/Hw/Chx001/../HwUtil/CBiosI2C.h \
    $(wildcard include/config/I2C_BY_BUSNUM) \
    $(wildcard include/config/I2C_BY_REG) \
  src/cbios/Hw/Chx001/../HwCallback/CBiosCallbacksHw.h \
  src/cbios/Hw/Chx001/CBiosVCP_chx.h \

src/cbios/Hw/Chx001/CBiosVCP_chx.o: $(deps_src/cbios/Hw/Chx001/CBiosVCP_chx.o)

$(deps_src/cbios/Hw/Chx001/CBiosVCP_chx.o):
