# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

MY_PN=MCFM
MY_P=${MY_PN}-${PV}


DESCRIPTION="Monte Carlo for FeMtobarn processes"
HOMEPAGE="https://mcfm.fnal.gov"
SRC_URI="https://mcfm.fnal.gov/downloads/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=( 	
	"${FILESDIR}"/${P}-qd.patch 
)

# Manual states multithreading bug in lhapdf-6.3.0 ?!
# MCFM has been tested against lhapdf-6.2.0 which ::gentoo already dropped
DEPEND="
	>sci-physics/lhapdf-6.3.0
	>=sci-libs/qd-2.3.22
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	local mycmakeargs=(
		-Duse_external_lhapdf=ON
		-Duse_internal_lhapdf=OFF
		-Dlhapdf_include_path=ON
		#-Dwith_vvamp=OFF
	)
	cmake_src_configure
}

src_compile() {
	# single thread force needed since fortan mods depend on each other
	export MAKEOPTS=-j1
	default
}
