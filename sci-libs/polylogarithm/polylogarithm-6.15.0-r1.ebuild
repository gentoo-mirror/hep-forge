# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="Implementation of polylogarithms in C/C++/Fortran."
HOMEPAGE="https://github.com/Expander/polylogarithm"
SRC_URI="https://github.com/Expander/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm ~riscv"

IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"
PATCHES=(
    "${FILESDIR}"/${PN}-6.15.0-gnuinstall.patch
)

src_configure() {
	cmake_src_configure
}
