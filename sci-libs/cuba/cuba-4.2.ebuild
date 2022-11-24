# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit fortran-2

MY_P=Cuba-${PV}

DESCRIPTION="The Cuba library for multidimensional numerical integration"
HOMEPAGE="http://www.feynarts.de/cuba"
SRC_URI="http://www.feynarts.de/cuba/${MY_P}.tar.gz"

LICENSE="LGPL-3"

SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

#PATCHES=( "${FILESDIR}"/${P}-makefile.patch )

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default


	#export VER="${PV}"
	# necessary fix for prefix
	#sed -i "s/lib\$(LIBDIRSUFFIX)/$(get_libdir)/" makefile.in || die
}
src_compile() {
	emake lib
	# make shared lib
	FILES=$(ar xv libcuba.a |sed 's/x - //g')
	gcc -shared -Wall $FILES -lm -o libcuba.so

}

src_install() {
	default

	dolib.a libcuba.a
	dolib.so libcuba.so
	use doc && dodoc cuba.pdf
}
