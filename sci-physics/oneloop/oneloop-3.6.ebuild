# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# python only needed for create.py to get binaries
PYTHON_COMPAT=( python3_{9..11} )
inherit toolchain-funcs python-any-r1

DESCRIPTION="Library of one-loop scalar functions"
HOMEPAGE="
	https://helac-phegas.web.cern.ch/OneLOop.html
	https://bitbucket.org/hameren/oneloop
"
SRC_URI="http://helac-phegas.web.cern.ch/helac-phegas/tar-files/OneLOop-${PV}.tgz"
S="${WORKDIR}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	app-arch/unzip
	virtual/fortran
"

PATCHES=(
	"${FILESDIR}"/${P}-config.patch
)

src_configure() {
	tc-export FC
	sed -i "/FC = /s/gfortran/${FC}/g" Config || die
	sed -i "/FFLAGS = /s/ -O/${FFLAGS} -fPIC/g" Config || die
}

src_compile() {
	tc-export FC
	emake -f make_cuttools
	${EPYTHON} ./create.py || die "Failed to compile"
	#./create.py dynamic || die
	${FC} ${LDFLAGS} -Wl,-soname,libavh_olo.so -shared -o libavh_olo.so avh_olo.o
}

src_install() {
	dolib.a libavh_olo.a
	dolib.so libavh_olo.so
	doheader avh_olo.mod
}
