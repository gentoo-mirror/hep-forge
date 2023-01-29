EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit python-single-r1 

MY_PN="Herwig"
MY_PF=${MY_PN}-${PV}

DESCRIPTION="Herwig is a multi-purpose particle physics event generator."
SRC_URI="https://herwig.hepforge.org/downloads?f=${MY_PF}.tar.bz2"
HOMEPAGE="https://herwig.hepforge.org/"

S=${WORKDIR}/${MY_PF}
LICENSE=""
SLOT="7"
KEYWORDS="~amd64"
IUSE="+hepmc3 hepmc2"
REQUIRED_USE="
	^^ ( hepmc3 hepmc2 )
	${PYTHON_REQUIRED_USE}
"

RDEPEND="
    dev-libs/boost
	sci-libs/gsl
	>=sci-physics/rivet[python(-),${PYTHON_SINGLE_USEDEP}]
	>=sci-physics/fastjet[plugins]
    sci-physics/lhapdf
    sci-physics/thepeg
	hepmc2? ( sci-physics/hepmc:2=[-cm(-),gev(+)] )
	hepmc3? ( sci-physics/hepmc:3=[-cm(-),gev(+)] )
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
	>=dev-python/cython-0.29.24
"

# https://herwig.hepforge.org/tutorials/installation/manual.html
src_configure() {
	PREFIX_FJ=$(fastjet-config --prefix) || die
    econf \
        --with-thepeg="${SYSROOT}/usr" \
        --with-fastjet="$PREFIX_FJ" \
        --with-gsl="${SYSROOT}/usr" \
        --with-boost="${SYSROOT}/usr"
}

#--prefix=$INSTALL_LOC --with-thepeg=$INSTALL_LOC \
#            --with-fastjet=$INSTALL_LOC --with-gsl=$INSTALL_LOC \
#            --with-vbfnlo=$INSTALL_LOC   --with-njet=$INSTALL_LOC \
#            --with-gosam=$INSTALL_LOC  --with-openloops=/where/openloops/was/installed \
#            --with-madgraph=/where/madgraph/was/installed  \
#            --with-boost=$INSTALL_LOC \
#            --with-evtgen=$INSTALL_LOC --with-pythia=$INSTALL_LOC