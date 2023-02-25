# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="High-Precision Software"
HOMEPAGE="
	https://www.davidhbailey.com/dhbsoftware/
	https://github.com/APN-Pucky/mpfun90
"
SRC_URI="https://github.com/APN-Pucky/mpfun90/archive/refs/tags/2023-02-26.tar.gz"
S="${WORKDIR}/mpfun90-2023-02-26"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	tc-export FC
	emake -j1 dynamic FC=${FC}
}

src_install() {
	doheader *.mod
	dolib.so libmpfun90.so
	dolib.a libmpfun90.a
}
