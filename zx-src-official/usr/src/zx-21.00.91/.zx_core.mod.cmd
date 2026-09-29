savedcmd_zx_core.mod := printf '%s\n'   built-in_x86_64.o src/core_module.o | awk '!x[$$0]++ { print("./"$$0) }' > zx_core.mod
