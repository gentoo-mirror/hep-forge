# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

MY_P=COLLIER-${PV}

DESCRIPTION="A Complex One-Loop LIbrary with Extended Regularizations"
HOMEPAGE="https://collier.hepforge.org/index.html"
SRC_URI="https://collier.hepforge.org/downloads/?f=${P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="${EPREFIX}"/usr/$(get_libdir)
		-DSYSCONFIG_INSTALL_DIR="${EPREFIX}"/usr/$(get_libdir)/cmake
	)
	cmake_src_configure
}
