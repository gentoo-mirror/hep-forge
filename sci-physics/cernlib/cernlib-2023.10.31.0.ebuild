EAPI=8

SRC_URI="https://cernlib.web.cern.ch/download/2023_source/tar/cernlib-2023.10.31.0-free.tar.gz"
S="${WORKDIR}/cernlib-2023.10.31.0-free"

LICENSE="CERN"
SLOT="0"
KEYWORDS="GPL-2 LGPL-2 BS"

RDEPEND="
	x11-libs/motif:0
	virtual/lapack
	dev-lang/cfortran
	net-libs/libnsl"
DEPEND="${RDEPEND}
	x11-misc/imake
	x11-misc/makedepend
	virtual/pkgconfig"