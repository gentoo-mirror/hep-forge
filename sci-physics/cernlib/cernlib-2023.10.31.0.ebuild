EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

DESCRIPTION="CERNLIB - CERN's library for data analysis"
HOMEPAGE="https://cernlib.web.cern.ch/cernlib/"
SRC_URI="https://cernlib.web.cern.ch/download/2023_source/tar/${P}-free.tar.gz"
S="${WORKDIR}/${P}-free"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	x11-libs/motif:0
	virtual/lapack
	dev-lang/cfortran
	x11-libs/xbae
	net-libs/libnsl
	virtual/libcrypt:=
"
DEPEND="
	${RDEPEND}
	x11-misc/imake
	x11-misc/makedepend
	virtual/pkgconfig
"

src_install() {
	cmake_src_install
	# do not install cfortran.h, it conflicts with ROOT
	rm "${ED}"/usr/include/cfortran.h || die
	rm "${ED}"/usr/include/cfortran/cfortran.h || die
}
