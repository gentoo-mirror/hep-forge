# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Resummation for BSM particles"
HOMEPAGE="https://resummino.hepforge.org/"
SRC_URI="https://resummino.hepforge.org/downloads/?f=resummino3.0.zip"
S=${WORKDIR}/${PN}3.0

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="virtual/fortran
	>=sci-physics/lhapdf-6.3.0
	>=sci-physics/looptools-2.15
	>=sci-libs/gsl-2.7"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	cmake .
	make
}

src_install() {
	dobin build/bin/resummino
}

