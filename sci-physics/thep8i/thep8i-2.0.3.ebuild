# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

MY_P="TheP8I-${PV}"

DESCRIPTION="Lund hadronisation for Herwig. Part of earlier ThePEG codes."
HOMEPAGE="https://gitlab.cern.ch/TheP8I/TheP8I"
SRC_URI="https://gitlab.cern.ch/TheP8I/TheP8I/-/archive/${PV}/${MY_P}.tar.bz2"

S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
DEPEND="
	sci-physics/lhapdf
	sci-physics/thepeg
	sci-physics/pythia:8
	sci-libs/gsl
	test? ( sci-physics/herwig:7 )
"
RDEPEND="${DEPEND}"
RESTRICT="!test? ( test )"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DTHEP8I_ENABLE_TEST=$(usex test ON OFF)
		-DCMAKE_INSTALL_LIBDIR=$(get_libdir)/ThePEG
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodoc README.md
}
