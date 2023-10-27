# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit toolchain-funcs

DESCRIPTION="Home of the DPMJET event generator"
HOMEPAGE="
	https://dpmjetiii.hepforge.org/
	https://github.com/DPMJET/DPMJET
"

SRC_URI="https://github.com/DPMJET/DPMJET/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/DPMJET-${PV}"
KEYWORDS="~amd64"

LICENSE="BSD"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_compile() {
	tc-export CC CXX FC AR
	emake exe
}

src_install() {
	dobin bin/DPMJET
	dobin bin/DPMJET_direct
	dobin bin/PHOJET
	dobin bin/pho_aux
	dobin bin/photo_hadronic
	
	dolib.a lib/libDPMJET.a
}