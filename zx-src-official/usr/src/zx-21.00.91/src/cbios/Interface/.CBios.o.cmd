savedcmd_src/cbios/Interface/CBios.o := gcc -Wp,-MMD,src/cbios/Interface/.CBios.o.d -nostdinc -I/usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include -I/usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include/generated -I/usr/src/kernels/7.2.7-200.fc44.x86_64/include -I/usr/src/kernels/7.2.7-200.fc44.x86_64/include -I/usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include/uapi -I/usr/src/kernels/7.2.7-200.fc44.x86_64/arch/x86/include/generated/uapi -I/usr/src/kernels/7.2.7-200.fc44.x86_64/include/uapi -I/usr/src/kernels/7.2.7-200.fc44.x86_64/include/generated/uapi -include /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler-version.h -include /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/kconfig.h -include /usr/src/kernels/7.2.7-200.fc44.x86_64/include/linux/compiler_types.h -D__KERNEL__ -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=gnu11 -fms-extensions -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a -fcf-protection=branch -fno-jump-tables -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -march=x86-64 -mtune=generic -mno-red-zone -mcmodel=kernel -mstack-protector-guard-reg=gs -mstack-protector-guard-symbol=__ref_stack_chk_guard -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -mharden-sls=all -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -ftrivial-auto-var-init=zero -fzero-init-padding-bits=all -fno-stack-clash-protection -fdiagnostics-show-context=2 -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -fno-inline-functions-called-once -fmin-function-alignment=16 -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-type-limits -Wno-dangling-pointer -Wvla-larger-than=1 -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wno-array-bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src -Wall -fno-strict-aliasing -Wno-undef -Wno-unused -Wno-missing-braces -Wno-missing-attributes -Wno-overflow -Wno-missing-prototypes -Wno-missing-declarations -Werror -DZX_PCIE_BUS -DNEW_ZXFB -D__LINUX__ -O2 -fno-strict-aliasing -DZX_TRACE_EVENT=1 -DDRM_VERSION_CODE=LINUX_VERSION_CODE -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Callback -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor/DSIPanel -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor/EDPPanel -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Display -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Init -I/home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Util  -fsanitize=bounds-strict -fsanitize=shift    -DMODULE  -DKBUILD_BASENAME='"CBios"' -DKBUILD_MODNAME='"zx"' -D__KBUILD_MODNAME=zx -c -o src/cbios/Interface/CBios.o src/cbios/Interface/CBios.c  

source_src/cbios/Interface/CBios.o := src/cbios/Interface/CBios.c

deps_src/cbios/Interface/CBios.o := \
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
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/CBiosShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../CBios.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/CBiosTypes.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/CBIOSVER.H \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/CBiosChipShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/CBiosReg.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Callback/CBiosCallbacks.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Callback/../Device/CBiosShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/CBiosDisplayManager.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/CBiosDeviceShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/CBiosShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/../Display/CBiosMode.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/../Util/CBiosEDID.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Port/CBiosDSI.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Port/../Monitor/DSIPanel/CBiosDSIPanel.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Port/../Monitor/DSIPanel/../../CBiosShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Port/../Monitor/DSIPanel/../../../Callback/CBiosCallbacks.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Port/../Monitor/DSIPanel/../../../Hw/HwCallback/CBiosCallbacksHw.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Port/../Monitor/DSIPanel/../../../Hw/HwCallback/../../Device/CBiosShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/../Display/CBiosPathManager.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/../Display/../Device/CBiosShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Monitor/CBiosEDPPanel.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Monitor/../CBiosShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/../Device/Monitor/../../Display/CBiosPathManager.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Display/CBiosPathManager.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Util/CBiosEDID.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/CBiosDevice.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/CBiosDeviceShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/CBiosDVO.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/../CBiosDeviceShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor/CBiosHDMIMonitor.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor/../CBiosDeviceShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Monitor/CBiosDPMonitor.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/CBiosCompile.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/CBiosDSI.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/CBiosCRT.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/../Monitor/CBiosCRTMonitor.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/../Monitor/../../Display/CBiosDisplayManager.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/../Monitor/../CBiosDeviceShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/CBiosDP.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/../Monitor/CBiosDPMonitor.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/../Monitor/CBiosHDMIMonitor.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/../../Hw/HwBlock/CBiosPHY_DP.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/Port/../../Hw/HwBlock/../../Device/CBiosDeviceShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Hw/HwInterface/CBiosHwInterface.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Hw/HwInterface/../CBiosChipFunc.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Hw/HwInterface/../../CBios.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Hw/HwInterface/../../Device/CBiosChipShare.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Hw/HwInterface/../../Display/CBiosDisplayManager.h \
  /home/athena/C960_Project/zx-src-official/usr/src/zx-21.00.91/src/cbios/Device/../Hw/HwBlock/CBiosDIU_CSC.h \
  src/cbios/Interface/../Hw/HwInterface/CBiosHwInterface.h \
  src/cbios/Interface/../Callback/CBiosCallbacks.h \

src/cbios/Interface/CBios.o: $(deps_src/cbios/Interface/CBios.o)

$(deps_src/cbios/Interface/CBios.o):
