savedcmd_zx_core.o := ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments   -r -o zx_core.o @zx_core.mod  ; /usr/src/kernels/7.2.7-200.fc44.x86_64/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --prefix=16 --orc --retpoline --rethunk --sls --static-call --uaccess  --link  --module zx_core.o

zx_core.o: $(wildcard /usr/src/kernels/7.2.7-200.fc44.x86_64/tools/objtool/objtool)
