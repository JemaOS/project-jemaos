# Copyright (c) 2022 Jema Innovations Limited and the openJema Authors.
# Distributed under the license specified in the root directory of this project.

EAPI=7

DESCRIPTION="jemaos utils"
LICENSE="BSD-Jema"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${FILESDIR}"

RDEPEND="!chromeos-base/libwidevine"

DEPEND="${RDEPEND}"

src_install() {
	exeinto /usr/bin
	doexe "${FILESDIR}"/enable_libwidevine

  insinto /etc/init
  doins "${FILESDIR}"/init/jemaos-collect-log.conf

  exeinto /usr/share/cros/init
  doexe "${FILESDIR}"/scripts/collect_jemaos_log.sh
}
