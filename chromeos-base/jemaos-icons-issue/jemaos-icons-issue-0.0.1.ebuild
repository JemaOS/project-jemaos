# Copyright (c) 2022 Jema Innovations Limited and the openJema Authors.
# Distributed under the license specified in the root directory of this project.

EAPI="5"

DESCRIPTION="Fix os-settings and camera app icons after 12.2 OTA"
HOMEPAGE="http://jemaos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""
S="${FILESDIR}"

RDEPEND=""

DEPEND="${RDEPEND}"

src_install() {
  insinto /usr/share/jemaos_shell/icons_issue/
  doins ${FILESDIR}/*.tar.gz
  exeinto /usr/share/jemaos_shell/icons_issue/
  doexe ${FILESDIR}/*.sh
}
