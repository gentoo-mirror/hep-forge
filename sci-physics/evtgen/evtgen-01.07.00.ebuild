EAPI=8

inherit fortran-2

MY_PN="EvtGen"
MY_P=${MY_PN}-${PV}

DESCRIPTION=""
SRC_URI="https://evtgen.hepforge.org/downloads?f=${MY_P}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://evtgen.hepforge.org/"

S="${WORKDIR}/${MY_PN}/R$(ver_rs 1-2 '-')"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pythia photos tauola"

RDEPEND="
	sci-physics/hepmc:2=
	pythia? ( sci-physics/pythia )
	photos? ( sci-physics/photos )
	tauola? ( sci-physics/tauola )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	./configure --prefix=${D}/usr #--hepmcdir=${EPREFIX}/usr --pythiadir=${EPREFIX}/usr --photosdir=${EPREFIX}/usr --tauoladir=${EPREFIX}/usr
}

src_compile() {
	# force single threaded build
	MAKEOPTS="$MAKEOPTS -j1" emake
}

src_install() {
	emake install
}

