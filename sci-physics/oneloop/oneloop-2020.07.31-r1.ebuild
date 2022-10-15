# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs flag-o-matic

DESCRIPTION="Library of one-loop scalar functions"
HOMEPAGE="https://bitbucket.org/hameren/oneloop"
SRC_URI="https://bitbucket.org/hameren/oneloop/get/3762b8bad6ad.zip -> ${P}.zip"
S="${WORKDIR}/hameren-oneloop-3762b8bad6ad"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

# Manual states multithreading bug in lhapdf-6.3.0 ?!
# MCFM has been tested against lhapdf-6.2.0 which ::gentoo already dropped
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/unzip
	virtual/fortran
	dev-lang/python
"

PATCHES=(
    "${FILESDIR}"/${P}-config.patch
)


src_configure() {
	tc-export FC
	sed -i "/FC = /s/gfortran/${FC}/g" Config || die
	sed -i "/FFLAGS = /s/ -O/${FFLAGS}/g" Config || die
	emake -f make_cuttools
}

src_compile() {
	tc-export FC
	./create.py || die
	#./create.py dynamic || die
	${FC} -Wl,-soname,libavh_olo.so -shared -o libavh_olo.so avh_olo.o
}

src_install() {
	dolib.a libavh_olo.a
	dolib.so libavh_olo.so
	doheader avh_olo.mod
}
