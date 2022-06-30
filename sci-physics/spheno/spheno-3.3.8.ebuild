# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P=SPheno-${PV}

DESCRIPTION="SPheno stands for S(upersymmetric) Pheno(menology)"
HOMEPAGE="https://spheno.hepforge.org/"
SRC_URI="https://spheno.hepforge.org/downloads/?f=${MY_P}.tar.gz"

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc examples"
DEPEND="virtual/fortran"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}"/${P}-gfortran.patch )

S="${WORKDIR}/${MY_P}"

src_compile() {
	export MAKEOPTS=-j1 # single thread force needed
	emake
}

src_install() {
	dobin bin/SPheno
	# convenience symlink since the package is lowercase but the default produced binary is upercase
	dosym /usr/bin/SPheno /usr/bin/spheno
	dolib.a lib/libSPheno.a
	doheader include/*

	use doc && dodoc doc/*
	if use examples; then
		docinto /usr/share/doc/${PF}/examples
		dodoc input/*
	fi
}
