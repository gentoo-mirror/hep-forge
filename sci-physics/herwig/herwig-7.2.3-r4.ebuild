EAPI=8

PYTHON_COMPAT=( python3_{10..11} )

inherit python-single-r1 autotools

MY_PN="Herwig"
MY_PF=${MY_PN}-${PV}

DESCRIPTION="Herwig is a multi-purpose particle physics event generator."
SRC_URI="https://herwig.hepforge.org/downloads?f=${MY_PF}.tar.bz2 -> ${P}.tar.bz2"
HOMEPAGE="https://herwig.hepforge.org/"

S=${WORKDIR}/${MY_PF}
LICENSE="GPL-3+"
SLOT="7"
KEYWORDS="~amd64"
IUSE="pythia openloops gosam madgraph vbfnlo njet"
REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
"

RDEPEND="
	>=dev-libs/boost-1.62
	>=sci-libs/gsl-2.6
	sci-physics/lhapdf-sets[lhapdf_sets_ct14lo,lhapdf_sets_ct14nlo]
	>=sci-physics/lhapdf-6.1.6[python(+),${PYTHON_SINGLE_USEDEP}]
	|| (
		>=sci-physics/thepeg-2.1.0[lhapdf,fastjet,hepmc2,-hepmc3,rivet]
		>=sci-physics/thepeg-2.1.0[lhapdf,fastjet,-hepmc2,hepmc3,rivet]
	)
	<sci-physics/evtgen-02.00.00[pythia,herwig]
	pythia? ( <sci-physics/pythia-8.3:8= )
	madgraph? ( sci-physics/madgraph5 )
	openloops? ( sci-physics/openloops )
	gosam? ( sci-physics/gosam )
	vbfnlo? ( sci-physics/vbfnlo )
	njet? ( sci-physics/njet )
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	eautoreconf
}


# https://herwig.hepforge.org/tutorials/installation/manual.html
# Minimal installation for now
src_configure() {
	econf \
		--with-evtgen="${EPREFIX}"/usr \
		--with-fastjet="${EPREFIX}"/usr \
		--with-thepeg="${EPREFIX}"/usr \
		--with-boost="${EPREFIX}"/usr \
		$(use_with gosam gosam "${EPREFIX}"/usr) \
		$(use_with madgraph madgraph "${EPREFIX}"/opt/MadGraph5/ ) \
		$(use_with openloops openloops "${EPREFIX}"/opt/OpenLoops2/ ) \
		$(use_with pythia pythia "${EPREFIX}"/usr) \ 
		$(use_with vbfnlo vbfnlo "${EPREFIX}"/usr) \
		$(use_with njet njet "${EPREFIX}"/usr)
}

src_install() {
	default
}
