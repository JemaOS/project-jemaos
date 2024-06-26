# Copyright (c) 2022 Jema Technology# Distributed under the license specified in the root directory of this project.

EAPI="5"

EGIT_REPO_URI="${JEMAOS_GIT_HOST_URL}/jemaos-hardware-tuning.git"
EGIT_BRANCH="main"

inherit git-r3
DESCRIPTION="Tunning system driver and configrations in console mode"
HOMEPAGE="http://jemakey.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

src_install() {
  insinto /usr/share/hwtuner-script
  doins -r lib
  doins -r menu
  exeinto /usr/share/hwtuner-script
  doexe hwtuner
  doexe hwtuner_info
  dosym /usr/share/hwtuner-script/hwtuner /usr/bin/hwtuner
  dosym /mnt/stateful_partition/unencrypted/gesture/55-alt-touchpad-cmt.conf /etc/gesture/55-alt-touchpad-cmt.conf
  dosym /mnt/stateful_partition/unencrypted/gesture/60-user-defined-devices.conf /etc/gesture/60-user-defined-devices.conf
}
