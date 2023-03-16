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
SRC_URI="https://bitbucket.org/hameren/oneloop/get/3762b8bad6ad.zip -> ${P}.zip"
S="${WORKDIR}/hameren-oneloop-3762b8bad6ad"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+dpkind +qpkind qpkind16 dpkind16 qdcpp ddcpp mpfun90 arprec tlevel cppintf"
REQUIRED_USE="
	?? ( dpkind dpkind16 ddcpp )
	?? ( qpkind qpkind16 qdcpp )
	?? ( arprec mpfun90 )
	|| ( dpkind dpkind16 ddcpp qpkind qpkind16 qdcpp )
"

DEPEND="
	qpkind? ( sci-libs/qd )
	qpkind16? ( sci-libs/qd )
	arprec? ( sci-libs/arprec )
"
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
	# set fortran
	sed -i "/FC = /s/gfortran/${FC}/g" Config || die
	sed -i "/FFLAGS = /s/ -O/${FFLAGS} -fPIC/g" Config || die
}

src_compile() {
	tc-export FC
	emake -f make_cuttools
	${EPYTHON} ./create.py || die "Failed to compile"
	# create.py does not use soname, so we do it ourself
	#./create.py dynamic || die
	${FC} ${LDFLAGS} -Wl,-soname,libavh_olo.so -shared -o libavh_olo.so avh_olo.o
}

src_install() {
	dolib.a libavh_olo.a
	dolib.so libavh_olo.so
	doheader *.mod
}
