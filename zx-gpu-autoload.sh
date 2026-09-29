#!/usr/bin/env bash
#
# zx-gpu-autoload.sh — 兆芯 KX-6000 C-960 显卡驱动(zx.ko + zx_core.ko) 开机自动加载配置
# 适用: Fedora/Red Hat(dracut + systemd-modules-load), 自编译 21.00.91 驱动
#
# 用法:
#   sudo bash zx-gpu-autoload.sh                # 用当前目录下的 zx.ko/zx_core.ko 配置
#   sudo bash zx-gpu-autoload.sh /路径/到/源码  # 指定编译目录
#   sudo bash zx-gpu-autoload.sh --uninstall    # 还原本脚本做的一切改动(退回手动加载)
#
# 原理:
#   1) 把 zx.ko / zx_core.ko 装入 /lib/modules/$(uname -r)/extra/
#   2) depmod 重建模块依赖
#   3) /etc/modules-load.d/zx.conf 让 systemd 开机自动 modprobe(先 core 后主模块)
#   4) /etc/dracut.conf.d/zx.conf + dracut --force 把驱动塞进 initramfs(开机阶段即加载)
#   这样重启后登录即是自编译驱动 + 1920x1200, 不再闪 simpledrm/1024x768
#
# 每步都带自检: 模块装完后 depmod 必须能用 modinfo 找到(modinfo zx),
# 否则报错退出 —— 曾遇到"模块装了但 depmod 没登记导致自动加载失效"的坑, 这里强制拦住。
#
set -euo pipefail

# ---------- 工具函数 ----------
die()  { echo -e "\e[31m[错误]\e[0m $*" >&2; exit 1; }
info() { echo -e "\e[36m[信息]\e[0m $*"; }
ok()   { echo -e "\e[32m[完成]\e[0m $*"; }

# ---------- 参数解析 ----------
ACTION=install
SRC_DIR=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --uninstall) ACTION=uninstall; shift ;;
        -h|--help)   sed -n '2,15p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
        *)           SRC_DIR="$1"; shift ;;
    esac
done

# ---------- 权限检查 ----------
[[ $EUID -eq 0 ]] || die "请用 root 运行: sudo bash $0 [源码目录]"

# ---------- 关键路径 ----------
KV=$(uname -r)
MOD_DIR="/lib/modules/$KV/extra"
LOAD_CONF="/etc/modules-load.d/zx.conf"
DRACUT_CONF="/etc/dracut.conf.d/zx.conf"

# ============================================================
#  安装
# ============================================================
install() {
    # 1. 定位驱动文件
    local KDIR="${SRC_DIR:-$(pwd)}"
    [[ -f "$KDIR/zx.ko" && -f "$KDIR/zx_core.ko" ]] \
        || die "在 [$KDIR] 找不到 zx.ko / zx_core.ko, 请先编译或指定源码目录"
    info "使用驱动: $KDIR/zx.ko, $KDIR/zx_core.ko (内核 $KV)"

    # 2. 内核匹配校验(防止把别的内核编的 .ko 装进来)
    local vermagic
    vermagic=$(modinfo -F vermagic "$KDIR/zx.ko" 2>/dev/null || true)
    if [[ -n "$vermagic" && "$vermagic" != *"$KV"* ]]; then
        die "zx.ko 是为内核 [$vermagic] 编译的, 与当前内核 [$KV] 不匹配, 请重新编译后再装"
    fi
    [[ -n "$vermagic" ]] && ok "内核匹配校验通过: $vermagic"

    # 3. 安装到标准模块路径(不改动当前已加载的运行中模块)
    mkdir -p "$MOD_DIR"
    install -m 0644 "$KDIR/zx.ko"     "$MOD_DIR/zx.ko"
    install -m 0644 "$KDIR/zx_core.ko" "$MOD_DIR/zx_core.ko"
    ok "已安装到 $MOD_DIR"

    # 4. 重建模块依赖 + 自检: depmod 必须把模块登记进依赖表
    depmod -a "$KV"
    if ! modinfo zx >/dev/null 2>&1; then
        die "depmod 后 modinfo zx 仍找不到模块! 模块未被登记, 开机无法自动加载。\n"\
"   请检查: 模块 vermagic 是否匹配内核、/lib/modules/$KV/extra 是否有 zx.ko、内核是否已更新"
    fi
    grep -q "extra/zx.ko" "/lib/modules/$KV/modules.dep" \
        || die "modules.dep 未登记 zx, depmod 异常"
    ok "depmod 完成, modinfo zx 已登记: $(modinfo -F filename zx 2>/dev/null)"

    # 5. 开机自动加载(先 core 后主模块)
    printf 'zx_core\nzx\n' > "$LOAD_CONF"
    ok "已写入 $LOAD_CONF"

    # 6. 塞进 initramfs(开机早期就加载) + 自检: 确认 initramfs 真包含模块
    if command -v dracut >/dev/null 2>&1; then
        printf 'add_drivers+=" zx_core zx "\n' > "$DRACUT_CONF"
        dracut --force
        if command -v lsinitrd >/dev/null 2>&1; then
            if ! lsinitrd 2>/dev/null | grep -q "extra/zx.ko"; then
                die "initramfs 重建后未包含 zx 模块(lsinitrd 无 extra/zx.ko), 请检查 dracut 配置"
            fi
            ok "initramfs 已重建, 且已包含 zx 驱动"
        else
            info "未找到 lsinitrd, 跳过 initramfs 内容校验(仅 modules-load 生效)"
        fi
    else
        info "未找到 dracut, 跳过 initramfs 重建(仅 modules-load 生效)"
    fi

    # 7. modprobe 预检(不真正加载, 只确认开机时 modprobe 能找到并解析依赖)
    if modprobe -n zx_core >/dev/null 2>&1 && modprobe -n zx >/dev/null 2>&1; then
        ok "modprobe 预检通过: 开机可自动加载 zx_core -> zx"
    else
        die "modprobe 预检失败(依赖未解析), 开机将无法自动加载, 请检查 depmod 结果"
    fi

    # 8. 结果确认
    echo
    info "配置完成, 当前内核 $KV 下:"
    modinfo -F version "$MOD_DIR/zx.ko" 2>/dev/null | sed 's/^/   zx.ko 版本: /'
    ls -l "$MOD_DIR/"
    echo
    info "重启验证: 登录后 lsmod | grep zx 应显示 zx/zx_core, 分辨率应为 1920x1200"
    info "注意: 内核升级(新 uname -r)后需在新内核下重新编译并重跑本脚本"
}

# ============================================================
#  卸载(还原为手动加载)
# ============================================================
uninstall() {
    info "还原本脚本所做改动..."
    rm -f "$LOAD_CONF" "$DRACUT_CONF"
    rm -f "$MOD_DIR/zx.ko" "$MOD_DIR/zx_core.ko"
    depmod -a "$KV" 2>/dev/null || true
    if command -v dracut >/dev/null 2>&1; then
        dracut --force 2>/dev/null || true
    fi
    ok "已还原。之后请手动加载: sudo insmod zx_core.ko && sudo insmod zx.ko"
}

# ---------- 执行 ----------
case "$ACTION" in
    install)   install ;;
    uninstall) uninstall ;;
esac
#（注：内容由AI生成）
