
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

DESCRIPTION="Photon pomoeron Monte Carlo generator"
HOMEPAGE="
	https://starlight.hepforge.org/
"

SRC_URI="https://starlight.hepforge.org/downloads/?f=${PN}_r${PV}.tar -> ${P}.tar" # weird hepforge download names
S="${WORKDIR}/"
KEYWORDS="~amd64"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+pythia6 +pythia8 dpmjet"

RDEPEND="
    pythia6? ( sci-physics/pythia:6 )
    pythia8? ( sci-physics/pythia:8 )
    dpmjet? ( sci-physics/dpmjet )
"
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"

src_prepare() {
    sed -i 's/-Werror//g' CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
        -DENABLE_PYTHIA6=$(usex pythia6 ON OFF)
        -DENABLE_PYTHIA8=$(usex pythia8 ON OFF)
        -DENABLE_DPMJET=$(usex dpmjet ON OFF)
	)
	cmake_src_configure
}

src_install() {
    # get build dir

    dobin "${BUILD_DIR}"/starlight
}