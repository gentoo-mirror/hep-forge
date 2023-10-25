
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit cmake

DESCRIPTION="Photon pomoeron Monte Carlo generator"
HOMEPAGE="
	https://starlight.hepforge.org/
"

SRC_URI="https://starlight.hepforge.org/downloads/?f=${PN}-r${PV}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
S="${WORKDIR}/"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"