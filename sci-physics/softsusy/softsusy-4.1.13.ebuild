# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit fortran-2 autotools

DESCRIPTION="Calculates supersymmetric particle spectra "
HOMEPAGE="
	https://ballanach.github.io/softsusy/
	https://softsusy.hepforge.org/
	https://github.com/BAllanach/softsusy
"
SRC_URI="https://softsusy.hepforge.org/downloads/${P}.tar.gz"
#S=${WORKDIR}/${MY_P}

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	#find ${WORKDIR} -name '*.la' -delete || die
	#default
	dolib.so .libs/*.so*
	dobin .libs/*.x
}
