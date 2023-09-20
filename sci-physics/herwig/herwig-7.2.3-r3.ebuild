EAPI=8

PYTHON_COMPAT=( python3_{10..11} )

inherit python-single-r1 autotools

MY_PN="Herwig"
MY_PF=${MY_PN}-${PV}

DESCRIPTION="Herwig is a multi-purpose particle physics event generator."
SRC_URI="
	https://herwig.hepforge.org/downloads?f=${MY_PF}.tar.bz2
	https://lhapdfsets.web.cern.ch/lhapdfsets/current/CT14lo.tar.gz
	https://lhapdfsets.web.cern.ch/lhapdfsets/current/CT14nlo.tar.gz
	"
HOMEPAGE="https://herwig.hepforge.org/"

S=${WORKDIR}/${MY_PF}
LICENSE="GPL-3+"
SLOT="7"
KEYWORDS="~amd64"
IUSE="pythia openloops gosam madgraph" # vbfnlo njet
REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
"

RDEPEND="
	>=dev-libs/boost-1.62
	>=sci-libs/gsl-2.2.1
	>=sci-physics/lhapdf-6.1.6[python(+),${PYTHON_SINGLE_USEDEP}]
	>=sci-physics/thepeg-2.1.0[lhapdf,fastjet,hepmc2,-hepmc3,rivet]
	<sci-physics/evtgen-02.00.00[pythia,herwig]
	pythia? ( <sci-physics/pythia-8.3:8= )
	madgraph? ( sci-physics/madgraph5 )
	openloops? ( sci-physics/openloops )
	gosam? ( sci-physics/gosam )
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
		$(use_with pythia pythia "${EPREFIX}"/usr)
	#  'madgraph','njet','openloops','gosam','vbfnlo',
}

src_install() {
	# Herwig needs
	#lhapdf update || die
	#lhapdf install CT14lo || die
	#lhapdf install CT14nlo || die
    echo "13200 CT14lo 1" >> "${WORKDIR}/pdfsets.index"
	echo "13100 CT14nlo 1" >> "${WORKDIR}/pdfsets.index"
	LHAPDF_DATA_PATH="${WORKDIR}" default
	insinto /usr/share/LHAPDF
	# check if already installed
	if [ ! -f "${EPREFIX}/usr/share/LHAPDF/pdfsets.index" ]; then
		doins pdfsets.index
	fi
	if [ ! -d "${EPREFIX}/usr/share/LHAPDF/CT14lo" ]; then
		doins -r CT14lo
	fi
	if [ ! -d "${EPREFIX}/usr/share/LHAPDF/CT14nlo" ]; then
		doins -r CT14nlo
	fi
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
