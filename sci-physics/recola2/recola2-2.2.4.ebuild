# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
PYTHON_COMPAT=( python3_{8..10} )

inherit cmake python-single-r1

DESCRIPTION="Recursive Computation of 1-Loop Amplitudes."
HOMEPAGE="https://recola.gitlab.io/recola2/index.html"
SRC_URI="https://recola.hepforge.org/downloads/?f=${P}.tar.gz"
#S=${WORKDIR}/${PN}-collier-${PV}

LICENSE="GPL-3+"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="+SM SM_BFM HS HS_BFM THDM THDM_BFM SMWZP HT HEFT HEFT_BFM SM_ATGC SMSP"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	sci-physics/collier
	SM? ( =ci-physics/recola2-SM )
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/unzip
	virtual/fortran
"
src_configure() {
	local mycmakeargs=(
		-Dwith_python3=ON
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	python_optimize
}
