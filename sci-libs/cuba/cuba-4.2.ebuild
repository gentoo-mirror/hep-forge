# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools fortran-2 toolchain-funcs

MY_P=Cuba-${PV}

DESCRIPTION="The Cuba library for multidimensional numerical integration"
HOMEPAGE="http://www.feynarts.de/cuba"
SRC_URI="http://www.feynarts.de/cuba/${MY_P}.tar.gz"

LICENSE="LGPL-3"

SLOT="0"
KEYWORDS="~amd64" # Keyword masked since cubatest crashes
IUSE="doc"

S="${WORKDIR}/${MY_P}"
RESTRICT="test" #broken...

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	eautoreconf
}

src_compile() {
	tc-export CC CXX FC AR
	sed 's/CFLAGS =/CFLAGS = -fPIC/g' --in-place makefile || die
	sed 's/FFLAGS =/FFLAGS = -fPIC/g' --in-place makefile || die
	emake lib -j1
	# make shared lib
	FILES=$(${AR} xv libcuba.a |sed 's/x - //g' || die)
	# unquoted FILES since newlines should be replaces by spaces
	${CC} -shared -Wall $FILES -lm -o libcuba.so
}

src_install() {
	#default # broken...

	doheader cuba.h
	dolib.a libcuba.a
	dolib.so libcuba.so
	use doc && dodoc cuba.pdf
}
