# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="Obtain constraints from vacuum stability in BSM models with many scalar fields"
HOMEPAGE="
    https://jonaswittbrodt.gitlab.io/EVADE/
    https://gitlab.com/jonaswittbrodt/EVADE/-/tree/master?ref_type=heads
"
SRC_URI="https://gitlab.com/jonaswittbrodt/EVADE/-/archive/c94158c18b2362788cf9d6915496d24b7d887fb4/EVADE-c94158c18b2362788cf9d6915496d24b7d887fb4.tar.gz -> evade-${PV}.tar.gz"
S="${WORKDIR}/EVADE-c94158c18b2362788cf9d6915496d24b7d887fb4"

LICENSE="MIT"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="
    >=sci-mathematics/bertini-1.6
    sci-mathematics/hom4ps
	sci-physics/slhalib
    dev-libs/libconfig[cxx]
    dev-cpp/eigen
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
    # Append install of bins to CMakeLists.txt
    echo "install(TARGETS EVADE DESTINATION ${EPREFIX}/usr/$(get_libdir))" >> CMakeLists.txt
    echo "install(TARGETS EVADE_CDN2HDM  EVADE_MSSM  EVADE_MSSM_B  EVADE_MuNuSSM  EVADE_MuNuSSM_B  EVADE_N2HDM  EVADE_NMSSM  EVADE_TRSM DESTINATION ${EPREFIX}/usr/bin)" >> CMakeLists.txt
    echo "install(DIRECTORY include/EVADE DESTINATION ${EPREFIX}/usr/include)" >> CMakeLists.txt
    local mycmakeargs=(
		-DHOM4PS2_EXECUTABLE=1 -DBERTINI_EXECUTABLE=1
	)
    cmake_src_configure
}

src_compile() {
    cmake_src_compile
}

src_install() {
    cmake_src_install
    #dobin EVADE_CDN2HDM  EVADE_MSSM  EVADE_MSSM_B  EVADE_MuNuSSM  EVADE_MuNuSSM_B  EVADE_N2HDM  EVADE_NMSSM  EVADE_TRSM
    #dolib.so lib/libEVADE.so
    #doheader -r include/*
}
