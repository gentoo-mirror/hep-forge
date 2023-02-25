# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# python only needed for create.py to get binaries
PYTHON_COMPAT=( python3_{8..11} )
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
IUSE="+dpkind +qpkind qpkind16 dpkind16 qdcpp ddcpp mpfun90 arprec tlevel cppintf kindtypes"
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

src_configure() {
	tc-export FC
	# set fortran
	sed -i "/FC = /s/gfortran/${FC}/g" Config || die
	sed -i "/FFLAGS = /s/ -O/${FFLAGS} -fPIC/g" Config || die
	# Clear config
	sed -i "s/^DPKIND.*$//g" Config || die
	sed -i "s/^QPKIND.*$//g" Config || die

	use dpkind && echo "DPKIND = kind(1d0)" >> Config
	use qpkind && echo "QPKIND = kind(1d0)" >> Config
	use dpkind16 && echo "DPKIND = 16" >> Config
	use qpkind16 && echo "QPKIND = 16" >> Config

	use kindtypes &&  echo "KINDMOD = kind_types"

	use qdcpp && echo "QDTYPE = qdcpp" >> Config
	use ddcpp && echo "DDTYPE = qdcpp" >> Config

	use mpfun90 && echo "MPTYPE = mpfun90" >> Config
	use arprec && echo "MPTYPE = arprec" >> Config

	if use tlevel ; then
		sed -i "s/^.*TLEVEL.*$/TLEVEL = yes/" Config || die
	else
		sed -i "s/^.*TLEVEL.*$/TLEVEL = no/" Config || die
	fi
	if use cppintf ; then
		sed -i "s/^.*CPPINTF.*$/CPPINTF = yes/" Config || die
	else
		sed -i "s/^.*CPPINTF.*$/CPPINTF = no/" Config || die
	fi
}

src_compile() {
	tc-export FC
	#emake -f make_cuttools
	${EPYTHON} ./create.py || die "Failed to compile"
	# create.py does not use soname, so we do it ourself
	#./create.py dynamic || die
	${FC} ${LDFLAGS} -Wl,-soname,libavh_olo.so -shared -o libavh_olo.so avh_olo.o
}

src_install() {
	dolib.a libavh_olo.a
	dolib.so libavh_olo.so
	doheader *.mod
	dosym ${EPREFIX}/usr/$(get_libdir)/libavh_olo.so ${EPREFIX}/usr/$(get_libdir)/liboneloop.so
	dosym ${EPREFIX}/usr/$(get_libdir)/libavh_olo.a ${EPREFIX}/usr/$(get_libdir)/liboneloop.a
}
