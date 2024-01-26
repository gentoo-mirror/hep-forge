EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

MY_PN="EvtGen"
MY_P=${MY_PN}-${PV}

DESCRIPTION=""
SRC_URI="https://evtgen.hepforge.org/downloads?f=${MY_P}.tar.gz"
HOMEPAGE="https://evtgen.hepforge.org/"

S="${WORKDIR}/${MY_PN}/R$(ver_rs 1-2 '-')"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pythia photos tauola"

RDEPEND="
	sci-physics/hepmc:2=
	sci-physics/hepmc:3=
	pythia? ( >=sci-physics/pythia-8.3.0 )
	photos? ( >=sci-physics/photos-3.64 )
	tauola? ( >=sci-physics/tauola-1.1.8 )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	local mycmakeargs=(
		-DEVTGEN_HEPMC3=ON
		-DHEPMC3_ROOT_DIR=${ESYSROOT}/usr
		-DEVTGEN_PYTHIA=$(usex pythia ON OFF)
		$(usex pythia -DPYTHIA8_ROOT_DIR=${ESYSROOT}/usr)
		-DEVTGEN_PHOTOS=$(usex photos ON OFF)
		-DEVTGEN_TAUOLA=$(usex tauola ON OFF)
	)
	cmake_src_configure
}

src_compile() {
	#export MAKEOPTS=-j1
	cmake_src_compile
}

src_install() {
	cmake_src_install
}

