EAPI=8

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
	sci-physics/hepmc:3=
	pythia? ( <sci-physics/pythia-8.3 )
	photos? ( >=sci-physics/photos-3.64 )
	tauola? ( >=sci-physics/tauola-1.1.8 )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	./configure --hepmcdir=${EPREFIX}/usr --pythiadir=${EPREFIX}/usr --prefix=${D}
}

src_compile() {
	MAKEOPS="$MAKEOPT -j1" emake
}

src_install() {
	emake install
}

