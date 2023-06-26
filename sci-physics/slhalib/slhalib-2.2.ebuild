# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit fortran-2

MY_P=SLHALib-${PV}

DESCRIPTION="a library for SUSY Les Houches Accord I/O"
HOMEPAGE="http://www.feynarts.de/slha"
SRC_URI="http://www.feynarts.de/slha/${MY_P}.tar.gz"

LICENSE="LGPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

#PATCHES=( "${FILESDIR}"/${P}-makefile.patch )

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default

	export VER="${PV}"
	# necessary fix for prefix
	sed -i "s#\$(PREFIX)/lib#\$(PREFIX)/$(get_libdir)#" makefile.in || die
}

src_install() {
	#default

    doheader src/*.h
    doheader build/*.h
	dolib.a build/libSLHA.a
	#rm "${ED}"/usr/$(get_libdir)/libSLHA.a || die
	use doc && dodoc *.pdf
}
