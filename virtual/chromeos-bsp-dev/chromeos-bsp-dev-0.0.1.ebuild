# Copyright (c) 2022 Jema Innovations Limited and the openJema Authors.
# Distributed under the license specified in the root directory of this project.

EAPI="7"

DESCRIPTION="empty project"
HOMEPAGE="http://jemaos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
    chromeos-base/jemaos_power_wash
    virtual/jemaos-arch-spec-dev
    virtual/jemaos-chip-spec-dev
    virtual/jemaos-board-spec-dev
"
#jemaos-dev-remote-patch

DEPEND="${RDEPEND}"