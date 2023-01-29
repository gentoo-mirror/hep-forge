# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="A Complex One-Loop LIbrary with Extended Regularizations"
HOMEPAGE="https://collier.hepforge.org/index.html"
SRC_URI="https://collier.hepforge.org/downloads/?f=${P}.tar.gz"

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
