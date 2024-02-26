EAPI=8

inherit cmake

CMAKE_MAKEFILE_GENERATOR="emake"

SRC_URI="https://cernlib.web.cern.ch/download/2023_source/tar/${P}-free.tar.gz"
S="${WORKDIR}/${P}-free"

LICENSE="CERN"
SLOT="0"
KEYWORDS="GPL-3"

RDEPEND="
	x11-libs/motif:0
	virtual/lapack
	dev-lang/cfortran
	x11-libs/xbae
	net-libs/libnsl
"
DEPEND="
	${RDEPEND}
	x11-misc/imake
	x11-misc/makedepend
	virtual/pkgconfig
"
