# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake


DESCRIPTION="An object-oriented one-loop scalar Feynman integrals framework"
HOMEPAGE="https://qcdloop.web.cern.ch/qcdloop/"
SRC_URI="https://github.com/scarrazza/${PN}/archive/refs/tags/${PV}.zip"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

# Manual states multithreading bug in lhapdf-6.3.0 ?!
# MCFM has been tested against lhapdf-6.2.0 which ::gentoo already dropped
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr/$(get_libdir)
	)
	cmake_src_configure
}
