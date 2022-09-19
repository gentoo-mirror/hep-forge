# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs flag-o-matic

MY_P=${PN}-v${PV}

DESCRIPTION="rapid numerical evaluation of generalised polylogarithms"
HOMEPAGE="https://gitlab.com/mule-tools/handyg"
SRC_URI="https://gitlab.com/mule-tools/${PN}/-/archive/v${PV}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	tc-export CC CXX FC AR
	./configure --prefix=/usr CC="${CC}" CFLAGS="${CFLAGS}" CXX="${CXX}" CXXFLAGS="${CXXFLAGS}" \
		FC="${FC}" FFLAGS="${FFLAGS}" AR="${AR}" LD="${FC}"
}

src_compile() {
	emake all
}

src_install() {
	# confiugure only creates static with --static
	mv libhandyg.a libhandyg.so
	dolib.so libhandyg.so
	doheader handyg.mod
	dobin geval
	# TODO pkgconfig ?
}
