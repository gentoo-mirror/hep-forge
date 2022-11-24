# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fortran-2 toolchain-funcs

MY_P=LoopTools-${PV}

DESCRIPTION="Tools for evaluation of scalar and tensor one-loop integrals"
HOMEPAGE="http://www.feynarts.de/looptools"
SRC_URI="http://www.feynarts.de/looptools/${MY_P}.tar.gz"

LICENSE="LGPL-3"

SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="doc"

PATCHES=( "${FILESDIR}"/${P}-makefile.patch )

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default

	export VER="${PV}"
	# necessary fix for prefix
	sed -i "s/lib\$(LIBDIRSUFFIX)/$(get_libdir)/" makefile.in || die
}
src_compile() {
	tc-export CC CXX FC AR
	emake CC="${CC}" CXX="${CXX}"
}

src_install() {
	default

	use doc && dodoc manual/*.pdf
}
