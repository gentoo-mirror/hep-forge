# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="Resummation for electroweak BSM particles."
HOMEPAGE="https://resummino.hepforge.org/"
SRC_URI="https://resummino.hepforge.org/downloads/?f=${P}.zip -> ${P}.zip}"
S="${WORKDIR}/${P}"

LICENSE="EPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="
	sci-physics/lhapdf
	>=sci-physics/looptools-2.15-r1
	>=sci-libs/gsl-2.0
	dev-libs/boost:0=
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/unzip
	virtual/fortran
"

src_prepare() {
	cmake_src_prepare
}

src_configure {
	local mycmakeargs=(
		-DBUILD_LHAPDF=OFF
		-DBUILD_LOOPTOOLS=OFF
	)
	cmake_src_configure 
}

src_install() {
	cmake_src_install
	dodoc README.md
}