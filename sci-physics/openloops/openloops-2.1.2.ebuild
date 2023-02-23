# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9,10} )

inherit python-single-r1 scons-utils

MY_P=OpenLoops-${PV}

DESCRIPTION="Evaluation of tree and one-loop matrix elements for any Standard Model."
HOMEPAGE="https://openloops.hepforge.org/index.html"
SRC_URI="https://openloops.hepforge.org/downloads?f=${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sci-physics/qcdloop
	sci-physics/oneloop
	sci-physics/collier
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	mv openloops.cfg.tmpl openloops.cfg
	sed -i 's/#compile_libraries.*/compile_libraries = rambo cuttools trred/' openloops.cfg || die
}

src_compile() {
	escons
}

src_install() {
	dobin openloops
	cd include
	doheader openloops.h
	# TODO use managed cuttools
	cd ../lib
	dolib.so libcuttools.so libopenloops.so librambo.so libtrred.so
}
