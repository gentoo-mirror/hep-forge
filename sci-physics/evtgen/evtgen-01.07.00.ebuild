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
IUSE="pythia photos tauola herwig"

RDEPEND="
	sci-physics/hepmc:2=
	pythia? ( <sci-physics/pythia-8.3 )
	photos? ( >=sci-physics/photos-3.64 )
	tauola? ( >=sci-physics/tauola-1.1.8 )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

PATCHES=(
	"$(usex herwig ${FILESDIR}/${PN}-01.07.00-herwig.patch)"
)

src_prepare() {
	default
	sed -i -e 's/FLIBS=.*/FLIBS="-lgfortran"/g' configure
	sed -i -e "s#{PREFIX}/lib#{PREFIX}/$(get_libdir)#g" Makefile
}

src_configure() {
	./configure  --prefix=${D}/usr --hepmcdir=${EPREFIX}/usr $(usex pythia --pythiadir=${EPREFIX}/usr) $(usex photos --photosdir=${EPREFIX}/usr) $(usex tauola --tauoladir=${EPREFIX}/usr)
}

src_compile() {
	export MAKEOPTS="$MAKEOPTS -j1"
	emake
}

src_install() {
	emake install
}

