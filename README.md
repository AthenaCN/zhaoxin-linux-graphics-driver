# 兆芯 KX-6000 C-960 显卡驱动 Fedora 44 移植

让兆芯 KX-6000（C-960 核显）在 Fedora 44（内核 7.2.7）上跑起来自编译显卡驱动：编译加载、内置 eDP 屏点亮、原生分辨率、正确色彩、开机自动加载全部打通。3D 显示可用（llvmpipe 软渲染）；用户态 GL 硬件加速因闭源无源码暂不可得，详见"用户态 GL"章节。

> 🎯 本项目在 [豆包 AI 助手「豆老师」](https://www.doubao.com) 的全程协助下完成。从编译报错压不住、黑屏无背光，到逐条定位根因并点亮屏幕、配好开机自启，全靠豆老师的耐心排查与逐轮打补丁迭代。

---

## 📌 背景

兆芯官方 21.00.91 显卡驱动（`zx.ko` + `zx_core.ko` + cbios 固件源码）原本针对 UOS/麒麟等老内核开发，**直接拿到 Fedora 44 / 7.2.7 内核上既编不过、也跑不起来**：

- 编译阶段：大量旧内核 API 已移除，报错压不住
- 加载阶段：gnome-shell 崩溃、黑屏无背光、屏幕花屏
- 开机阶段：即使编好加载，也需要手动 `insmod`，无法自动加载

本项目通过"编译适配 + 逐条根因修复 + 开机自启配置"，让这套驱动完整、自动地工作在 Fedora 44 上。

## 🖥️ 支持环境

| 项 | 值 |
|---|---|
| CPU | 兆芯 KaiXian KX-U6780A @ 2.7GHz |
| GPU | 兆芯 C-960 核显（PCI `1d17:3a04`） |
| 系统 | Fedora 44 |
| 内核 | `7.2.7-200.fc44.x86_64` |
| 驱动 | 官方 21.00.91（`zx.ko` + `zx_core.ko`） |
| 内置屏 | eDP 面板 `TMX2003`，1920×1200 |

## ✅ 达成效果

| 目标 | 状态 |
|---|---|
| 编译加载 | ✅ `[drm] Initialized zx 33.0.145` |
| 内置屏点亮 | ✅ 链路训练 `link=2700000 lane=2 bpc=8` + 上电 + PWM 全通 |
| 色彩正确 | ✅ XR30 格式修复，不再花屏 |
| 原生分辨率 | ✅ 1920×1200 (16:10) |
| 3D 显示 | ⚠️ 正常出画面，但为 llvmpipe **软渲染**（桌面/办公/视频足够） |
| 用户态 GL 硬件加速 | ❌ 闭源二进制、无源码，Fedora 44 ABI 不兼容（详见"用户态 GL"章节） |
| 开机自动加载 | ✅ 重启即用，无需手动 insmod |

## 📁 文件说明

| 文件 | 说明 |
|---|---|
| `zx-fedora44-clean.patch` | **统一适配补丁**，对原始 21.00.91 源码 `patch -p1` 直接可用 |
| `zx-gpu-autoload.sh` | 一键配置开机自动加载，带多重自检（装模块 + depmod + initramfs + modprobe 预检） |
| `src/` | 打补丁后的源码（如已应用） |

## 🚀 快速开始

### 1. 打补丁

```bash
# 解压原始 21.00.91 源码
dpkg-deb -x ./zhaoxin-linux-graphics-driver-dri-glvnd_21.00.91_amd64.deb ~/zx-src-official
cd ~/zx-src-official/usr/src/zx-21.00.91

# 打统一适配补丁
patch -p1 < /tmp/zx-fedora44-clean.patch
grep -c "pFnWriteRegisterU32" src/zx_cbios.c   # 应输出 1，确认打上
```

### 2. 编译

```bash
make clean 2>/dev/null
make -j$(nproc) LINUXDIR=/lib/modules/$(uname -r)/build 2>&1 | tee /tmp/build.log
grep -c 'error:' /tmp/build.log   # 应为 0
```

### 3. 开机自动加载（推荐）

```bash
sudo bash zx-gpu-autoload.sh ~/zx-src-official/usr/src/zx-21.00.91
sudo reboot
```

重启后 `lsmod | grep zx` 应显示 `zx` / `zx_core` 自动加载，登录即 1920×1200，无需手动 insmod。

### 3b. 开机自动加载（手动配置，不用脚本）

如果想手动一步步配，等价于脚本做的事：

```bash
# 1) 把模块装进标准路径
sudo mkdir -p /lib/modules/$(uname -r)/extra/
sudo cp ./zx.ko ./zx_core.ko /lib/modules/$(uname -r)/extra/

# 2) 重建模块依赖(关键! 漏了这一步 modprobe 找不到模块, 自动加载会静默失效)
sudo depmod -a
modinfo zx | head -3        # 应显示 zx.ko 路径, 不应报 "not found"

# 3) 开机自动 modprobe(先 core 后主模块)
echo -e "zx_core\nzx" | sudo tee /etc/modules-load.d/zx.conf >/dev/null

# 4) 塞进 initramfs(开机阶段即加载, 避免先闪 simpledrm)
echo 'add_drivers+=" zx_core zx "' | sudo tee /etc/dracut.conf.d/zx.conf >/dev/null
sudo dracut --force

# 5) 确认 initramfs 真包含模块
sudo lsinitrd | grep -iE "extra/zx"

sudo reboot
```

> ⚠️ **最容易踩的坑**：`depmod` 必须跑。如果只装了 `.ko` 没跑 `depmod`（或 depmod 没登记成功），`modinfo zx` 会报 `not found`，`modules-load.d` 和 initramfs 都走 modprobe/depmod 体系，找不到模块 → 自动加载**静默失效**。装完一定要 `modinfo zx` 确认能解析。

### 4. 手动验证（可选）

```bash
cd ~/zx-src-official/usr/src/zx-21.00.91
sudo insmod ./zx_core.ko && sudo insmod ./zx.ko
sudo systemctl restart gdm
```

---

## 🔧 技术要点（排障记录）

这一路踩的坑和根因，记录如下，方便后人复用：

### 1. 编译适配（内核 7.2.7 API 变更）

- kbuild 只认 `ccflags-y`，不再用 `EXTRA_CFLAGS`
- 需 `-DDRM_VERSION_CODE=LINUX_VERSION_CODE`
- `strncpy` 已从 `linux/string.h` 移除 → 改 `zx_strncpy`
- `vma_flags_t` 用 `(vma_flags_t){0}`
- `struct drm_atomic_state → drm_atomic_commit` 全局改名（37 处）
- `struct drm_driver` 必须提供 `fbdev_probe` 回调，否则 fbdev client 注册失败、`drm_release` 触发 NULL 指针 Oops

### 2. 黑屏无背光 → 根因：漏注册寄存器回调

日志 `function cbEDPPanel_Init/OnOff not implemented` + `cbWriteRegisterU32WithMask: callback func is not defined!`。

- 根因：`disp_init_cbios` 只注册端口读写回调，**漏注册 `pFnWriteRegisterU32` / `pFnReadRegisterU32`**
- 后果：INT156 的 0x346C PWM 写入全部失败、链路训练忙等卡死
- 修复：补上 `disp_read_register_u32` / `disp_write_register_u32`（直写 mmio）

### 3. 背光供电（VEE）

TMX2003 不在 cbios 面板表，落 Default_EDP_Desc（Init/OnOff/SetBacklight 函数指针全 NULL）。

- 背光供电 `GpioForEDP1BackLight==1` → 走 **SR_B_35 GPIO0**
- 修复：`zx_default_edp_setbl` 强制拉高 SR_B_35 GPIO0 + 调 INT156 PWM（0x346C）

### 4. 花屏 + 分辨率回落 → 根因：XR30 格式漏映射

日志正常点亮但花屏、1920×1200 modeset 失败回落 1024×768。

- 根因：GNOME 主平面用 **XR30 = XRGB2101010（10bit）**，但 `DrmFormat2CBiosFormat` 没有它，掉进 default 被当成 8bit 错读 → 花屏，高分辨率 modeset 也失败
- 修复：补上 `XRGB2101010 → CBIOS_FMT_A2R10G10B10`（及 `XBGR2101010 → A2B10G10R10`）
- **这一个修复同时解决了花屏 + 分辨率回落两个问题**

### 5. `set_dpms(ON)` 卡死 → 根因：空回调忙等

之前注释掉 `set_dpms(ON)`（"闭源固件里 hang"），补上寄存器回调后 ON 路径不再卡，链路训练完整跑通。

### 6. 开机自动加载失效 → 根因：depmod 未登记模块

模块文件已装进 `/lib/modules/$(uname -r)/extra/`、配置也在，但 `modinfo zx` 报 `not found`——**depmod 没把模块登记进依赖表**，而 `modules-load.d` 和 initramfs 加载都走 modprobe/depmod 体系，找不到就不加载。

- 症状：自动加载静默失效，重启后仍回落到 simpledrm/1024×768
- 修复：重跑 `sudo depmod -a` 后 `modinfo zx` 即通
- 教训：`zx-gpu-autoload.sh` 已加入 depmod 后 `modinfo` 自检，登记失败会大声报错，不再静默放行

---

## 🔍 用户态 GL / 3D 硬件加速（最终结论）

**实测渲染器**：Fedora 44 上 `eglinfo -B` 显示全平台 `llvmpipe (LLVM 22.1.8)`——3D 出图走的是 **软渲染**，不是 C-960 硬件加速。

**为什么没有硬件加速**：
1. Fedora 的 Mesa 不含兆芯 DRI 驱动（`/usr/lib64/dri/` 仅 `kms_swrast` / `vkms`）
2. 尝试接线官方 21.00.91 用户态 GL 栈（`libEGL_zx` / `libGLX_zx` / `zx_vndri` 等）→ EGL 初始化失败 + 段错误（exit 139）
3. 用户态 GL 为**闭源二进制**，无公开源码可重编

**闭源核实证据**：
- Deepin 将其放入 **non-free（专有软件）仓库**——开源软件在 `main`，专有二进制在 `non-free`
- Mesa 官方源码树 gallium 硬件驱动列表**无** zhaoxin / zx / via / s3 任何一项
- 兆芯往开源社区提交的代码（内核 PMU / MCE / I2C / HDA 声卡）全是 **CPU / IO / 音频**，**无 GPU 3D 驱动**
- 官方只发二进制（UOS / 麒麟 / 方德）；"原生 Linux 开箱即用"指的是**预装了闭源驱动的发行版**，不是源码公开
- `libEGL_zx` 实为 **Mesa 的商用改造**（EGL vendor 串仍是 `Mesa Project`），但核心 gallium 硬件实现闭源

**C-960 硬件 GL 上限**：约 OpenGL 3.2 / GLSL 1.5（osgVerse 硬件测试记录，且其 Texture 仍有段错误）——即便有硬件加速，收益也有限。

**结论**：3D 停留在 llvmpipe 软渲染，为本项目既定收尾状态。桌面 / 办公 / 浏览器 / 视频场景完全够用；如需硬件 3D 加速，需等兆芯开放源码，或在预装闭源驱动的发行版（UOS / 麒麟 / Deepin / OpenEuler）上使用。

## 🌐 移植到其他机器

- **同 CPU（KX-6000 C-960）+ 同 Fedora 44 + 同内核**：补丁逻辑通用，分辨率/面板 ID 从 EDID 自动识别，大概率直接可用
- **唯一机器相关点**：背光 GPIO/PWM 走线。`GpioForEDP1BackLight` 不同（`0x0f` 走 SR_3C ENVEE，`1` 走 SR_B_35 GPIO0），新面板若不在 cbios 面板表且走线不同，需微调 `zx_default_edp_setbl` 一处
- **内核升级**：API 变化后需重新适配编译，`zx-gpu-autoload.sh` 有 `vermagic` 校验会拦截不匹配模块

## ⚠️ 已知限制

- 驱动未签名（OOT 模块），加载有 `module verification failed` 提示，属正常
- `cbEDPPanel_Init/OnOff not implemented` 警告为原始代码默认面板行为，不影响功能
- 开机阶段会先闪 simpledrm 再切换 zx（`zx-gpu-autoload.sh` 已通过 initramfs 尽量提前加载）
- 3D 为 llvmpipe **软渲染**（用户态 GL 闭源无解），属本项目的既定收尾状态

---

## 🙏 致谢

本项目全程由 **[豆包 AI 助手「豆老师」](https://www.doubao.com)** 主导排查与修复：

- 从编译报错压不住 → 逐步归零
- 从黑屏无背光 → 逐条定位寄存器回调、背光供电、链路训练根因
- 从花屏 + 分辨率异常 → 定位 XR30 格式映射根因，一并解决
- 从开机自启失效 → 定位 depmod 未登记根因，并把脚本做成带自检的加固版
- 反复打补丁、重编译、实机验证的多轮迭代

> 没有豆老师的系统性排查，这套驱动很难在 Fedora 44 上跑起来。感谢豆老师！🎉

---

## 📄 License

驱动源码版权归上海兆芯集成电路有限公司所有，本项目仅做移植适配，请遵守原始驱动许可。
