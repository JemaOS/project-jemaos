# Copyright (c) 2022 Jema Innovations Limited and the openJema Authors.
# Distributed under the license specified in the root directory of this project.

# Copyright (c) 2017 The Flint OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="A typical non-generic implementation will install any board-specific configuration files and drivers which are not suitable for inclusion in a generic board overlay."
HOMEPAGE="http://jemaos.com"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
    chromeos-base/jemaos-console-issue
    chromeos-base/jemaos-default-apps
    app-i18n/chromeos-pinyin
    chromeos-base/jemaos-shell-daemon-go
    net-misc/jemaos-remote-help
    chromeos-base/jemaos-dev-remote-patch
    chromeos-base/jemaos-stateful-updater
    chromeos-base/jemaos_power_wash
    chromeos-base/jemaos-hardware-tuner
    net-misc/wget
    app-arch/zip
    app-editors/nano
    app-editors/vim
    sys-apps/usb-modeswitch-data
    chromeos-base/jemaos-updater
    chromeos-base/jemaos-utils
"
DEPEND="
    ${RDEPEND}
"
