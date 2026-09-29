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


MODULE_INFO(depends, "zx_core,video");

MODULE_ALIAS("pci:v00001D17d00003A03sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v00001D17d00003A04sv*sd*bc*sc*i*");
