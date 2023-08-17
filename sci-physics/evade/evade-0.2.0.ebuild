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
	sci-physics/slhalib
    dev-libs/libconfig[cxx]
    dev-cpp/eigen
    app-doc/doxygen
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
    cmake_src_configure
}

src_compile() {
    cmake_src_compile
}

src_install() {
    cmake_src_install
}
