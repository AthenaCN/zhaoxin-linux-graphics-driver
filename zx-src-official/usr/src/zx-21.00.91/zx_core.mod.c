#include <linux/module.h>
#include <linux/export-internal.h>
#include <linux/compiler.h>

MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

KSYMTAB_FUNC(krnl_get_core_interface, "");
SYMBOL_FLAGS(krnl_get_core_interface, 0x00);
KSYMTAB_DATA(zx_hang_dump, "");
SYMBOL_FLAGS(zx_hang_dump, 0x00);
KSYMTAB_DATA(zx_run_on_qt, "");
SYMBOL_FLAGS(zx_run_on_qt, 0x00);
KSYMTAB_DATA(zx_reboot_patch, "");
SYMBOL_FLAGS(zx_reboot_patch, 0x00);
KSYMTAB_DATA(zx_freezable_patch, "");
SYMBOL_FLAGS(zx_freezable_patch, 0x00);

MODULE_INFO(depends, "");

