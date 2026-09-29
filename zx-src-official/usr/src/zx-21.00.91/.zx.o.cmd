savedcmd_zx.o := ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments   -r -o zx.o @zx.mod  ; /usr/src/kernels/7.2.7-200.fc44.x86_64/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --prefix=16 --orc --retpoline --rethunk --sls --static-call --uaccess  --link  --module zx.o

zx.o: $(wildcard /usr/src/kernels/7.2.7-200.fc44.x86_64/tools/objtool/objtool)
