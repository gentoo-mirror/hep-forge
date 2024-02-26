EAPI=8

EAPI=8

SRC_URI="https://cernlib.web.cern.ch/download/2006_source/tar/2006_src.tar.gz"
S="${WORKDIR}/2006/src"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	x11-libs/motif:0
	virtual/lapack
	dev-lang/cfortran
	net-libs/libnsl"
DEPEND="${RDEPEND}
	x11-misc/imake
	x11-misc/makedepend
	virtual/pkgconfig"

src_compile() {
	./make_cernlib
	emake -j1 
}