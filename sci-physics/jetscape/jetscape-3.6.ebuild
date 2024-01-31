# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="JETSCAPE a framework for simulating all aspects of heavy-ion collisions."
HOMEPAGE="
	https://jetscape.org/
	https://github.com/JETSCAPE/JETSCAPE/
	https://arxiv.org/abs/1903.07706
"
SRC_URI="https://github.com/JETSCAPE/JETSCAPE/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/${PN^^}-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="freestream music iss smash ipglasma clvisc root"
DEPEND="
	dev-libs/boost:0=
	sys-libs/zlib
	sci-physics/pythia:8
	sci-libs/hdf5
	sci-libs/gsl
	sci-physics/hepmc:3
	virtual/mpi
	root? ( sci-physics/root )
	clvisc? ( virtual/opencl )
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_FREESTREAM=$(usex freestream ON OFF)
		-DUSE_CLVISC=$(usex clvisc ON OFF)
		-DUSE_IPGlasma=$(usex ipglasma ON OFF)
		-DUSE_ISS=$(usex iss ON OFF)
		-DUSE_SMASH=$(usex smash ON OFF)
		-DUSE_ROOT=$(usex root ON OFF)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
