#include <drm/drm_fb_helper.h>
#include <drm/clients/drm_client_setup.h>
#include "zx_disp.h"
#include "zx_cbios.h"
#include "zx_fbdev.h"
#include "zx_gem.h"
#include "zx_debugfs.h"

/*
 * zx_fbdev.c -- fbdev 模拟(移植到 7.x)
 *
 * 7.x 内核已移除旧的 per-driver drm_fb_helper 接口
 * (fb_probe 钩子 / dev->struct_mutex / drm_fb_helper_alloc_info 等),
 * 改用内核通用 fbdev 模拟 drm_fbdev_generic_setup()。
 * 因此这里不再自建 framebuffer, 交给内核通用路径,
 * 它通过驱动自身的 fb_create 分配 framebuffer。
 */

void zx_fbdev_disable_vesa(zx_card_t *zx)
{
	/* 冲突的 VESA/EFI framebuffer 已由 probe 阶段的
	 * drm_aperture_remove_conflicting_pci_framebuffers 处理 */
}

int zx_fbdev_init(zx_card_t *zx)
{
	/* drm_client_setup_with_color_mode(zx->drm_dev, 32); disabled: crashes gnome-shell */
	return 0;
}

int zx_fbdev_deinit(zx_card_t *zx)
{
	/* generic fbdev 由 drm_dev_unregister 自动清理 */
	return 0;
}

void zx_fbdev_set_suspend(zx_card_t *zx, int state)
{
	/* generic fbdev 的 suspend/resume 由内核 fb 子系统处理 */
}

void zx_fbdev_poll_changed(struct drm_device *dev)
{
	/* 7.x 未注册此回调(zx_disp.c 以 <6.12 守卫) */
}
