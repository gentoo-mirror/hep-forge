# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="A small-x resummation code"
HOMEPAGE="https://www.roma1.infn.it/~bonvini/hell/"

SRC_URI="
	https://www.roma1.infn.it/~bonvini/hell/downloads/HELLx.v${PV}.tgz -> ${P}.tgz
	https://www.roma1.infn.it/~bonvini/hell/downloads/HELLx-data.v3.tgz
"
S="${WORKDIR}/HELLx"
KEYWORDS="~amd64 ~arm64 ~arm ~riscv"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm ~riscv"
IUSE="examples"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_compile() {
	emake lib
	use examples && emake examples
}


src_install () {
	dolib.a libhell-x.a
	mv include ${PN}
	doheader -r ${PN}
	insinto /usr/share/${PN}
	doins -r data
	if use examples ; then
	   docinto examples
	   dodoc examples/*
	   docompress -x /usr/share/doc/${PF}/examples
	fi
}

