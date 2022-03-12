# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8822BU"
PKG_VERSION="f56d097a8b44043a13ac49e9a509a36738c0bf25"
PKG_SHA256="269f6e55c04c6823dba64aa4ca566a00d742e0e4e4160fb3208cd575c623805d"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/morrownr/88x2bu-20210702"
PKG_URL="https://github.com/morrownr/88x2bu-20210702/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Realtek RTL8822BU Linux driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
