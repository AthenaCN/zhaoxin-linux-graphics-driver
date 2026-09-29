savedcmd_zx.ko := ld -r -m elf_x86_64 -z noexecstack --no-warn-rwx-segments --build-id=sha1  -T /usr/src/kernels/7.2.7-200.fc44.x86_64/scripts/module.lds -o zx.ko zx.o zx.mod.o .module-common.o
