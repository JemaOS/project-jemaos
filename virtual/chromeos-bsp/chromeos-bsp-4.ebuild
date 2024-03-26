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
    !chromeos-base/chromeos-bsp-null
    virtual/jemaos-arch-spec
    virtual/jemaos-chip-spec
    virtual/jemaos-board-spec
    virtual/jemaos-variant-spec
    virtual/jemaos-chromedev-flags
	virtual/jemaos-bsp
	virtual/jemaos-bsp
"
DEPEND="
    ${RDEPEND}
"
