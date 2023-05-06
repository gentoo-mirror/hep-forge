# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Computing 1-loop amplitudes at the integrand level"
HOMEPAGE="https://www.ugr.es/~pittau/CutTools/"
SRC_URI="http://www.ugr.es/~pittau/CutTools/${PN}_v${PV}.tar.gz"
S="${WORKDIR}"

LICENSE="GPL-3"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="
	sci-physics/qcdloop
	sci-physics/oneloop[dpkind,-qpkind,-tlevel]
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"
src_prepare() {
	default
	sed -i 's/^ALL =.*$/ALL = $(CTS)/' src/makefile ||  die
}

src_compile() {
	emake -j1 FFLAGS="${FFLAGS} -I${ESYSROOT}/usr/include -fPIC -std=legacy"
	tc-export AR CXX
	cd includects
	${AR} -x libcts.a
	${CXX} -shared *.o -o lib${PN}.so
}

src_install() {
	cd includects
	dolib.so lib${PN}.so
	cd ..
	mv includects ${PN}
	rm ${PN}/*.a
	rm ${PN}/*.so
	rm ${PN}/*.o
	doheader -r ${PN}
}
