EAPI=8

PYTHON_COMPAT=( python3_{10..11} )

inherit python-single-r1 autotools

MY_PN="Herwig"
MY_PF=${MY_PN}-${PV}

DESCRIPTION="Herwig is a multi-purpose particle physics event generator."
SRC_URI="https://herwig.hepforge.org/downloads?f=${MY_PF}.tar.bz2"
HOMEPAGE="https://herwig.hepforge.org/"

S=${WORKDIR}/${MY_PF}
LICENSE="GPL-3+"
SLOT="7"
KEYWORDS="~amd64"
IUSE="pythia" # pythia vbfnlo openloops njet gosam madgraph
REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
"

RDEPEND="
	>=dev-libs/boost-1.62
	>=sci-libs/gsl-2.2.1
	>=sci-physics/lhapdf-6.1.6[python(+),${PYTHON_SINGLE_USEDEP}]
	>=sci-physics/thepeg-2.1.0[lhapdf,fastjet,hepmc,rivet]
	sci-physics/evtgen[pythia]
	pythia? ( >=sci-physics/pythia-8.0.0 )
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
		--with-evtgen="${EROOT}"/usr \
		--with-fastjet="${EROOT}"/usr \
		--with-thepeg="${EROOT}"/usr \
		$(use_with pythia pythia "${EROOT}"/usr)

}

src_install() {
	# Herwig needs
	#lhapdf update || die
	#lhapdf install CT14lo || die
	#lhapdf install CT14nlo || die
	default
}

#--prefix=$INSTALL_LOC --with-thepeg=$INSTALL_LOC \
#            --with-fastjet=$INSTALL_LOC 
#            --with-gsl=$INSTALL_LOC \
#            --with-vbfnlo=$INSTALL_LOC   
#            --with-njet=$INSTALL_LOC \
#            --with-gosam=$INSTALL_LOC  
#            --with-openloops=/where/openloops/was/installed \
#            --with-madgraph=/where/madgraph/was/installed  \
#            --with-boost=$INSTALL_LOC \
#            --with-evtgen=$INSTALL_LOC --with-pythia=$INSTALL_LOC
