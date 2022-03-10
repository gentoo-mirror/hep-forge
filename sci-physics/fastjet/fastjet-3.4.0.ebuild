# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=fastjet

DESCRIPTION="A software package for jet finding in pp and e+e- collisions"
HOMEPAGE="http://fastjet.fr/"
SRC_URI="http://fastjet.fr/repo/${P}.tar.gz"
#S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
sys-devel/gcc[fortran]
dev-lang/python
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	econf --prefix=/usr --enable-allplutgins --enable-static=no --enable-pyeext
}
src_compile() {
	default
}

src_install() {
	default
}
