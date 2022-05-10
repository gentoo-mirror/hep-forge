# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Resummation for electroweak BSM particles."
HOMEPAGE="https://resummino.hepforge.org/"
SRC_URI="https://resummino.hepforge.org/downloads/?f=resummino${PV}.zip"
S=${WORKDIR}/${PN}${PV}

LICENSE="EPL-2.0"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="
	app-arch/unzip
	virtual/fortran
	sci-physics/lhapdf
	=sci-physics/looptools-2.15-r1
	>=sci-libs/gsl-2.0"
RDEPEND="${DEPEND}"
BDEPEND=""

# No need for patches here
#PATCHES=( "${FILESDIR}"/${P}-looptools.patch )

src_compile() {
	cmake .
	make
}

src_install() {
	dobin bin/resummino
}
