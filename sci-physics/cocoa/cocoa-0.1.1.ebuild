# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="A nearly-hermetic calorimeter simulated with Geant4 and interfaced to the Pythia8 event generator."
HOMEPAGE="https://github.com/cocoa-hep/cocoa-hep/"
SRC_URI="https://github.com/cocoa-hep/cocoa-hep/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
DEPEND="
    sci-physics/clhep
    sys-libs/zlib
	sci-physics/hepmc
	sci-physics/pythia
	sci-physics/fastjet
    dev-libs/jsoncpp
    sys-libs/liburing
	sci-physics/root
	sci-physics/geant
	sci-physics/geant-data
    dev-libs/expat
    dev-libs/xerces-c
"
RDEPEND="${DEPEND}"
RESTRICT="!test? ( test )"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
