# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Integrand Reduction via Laurent Expansion method for the computation of one-loop integrals."
HOMEPAGE="https://ninja.hepforge.org/"
SRC_URI="https://ninja.hepforge.org/downloads?f=${P}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3+"
KEYWORDS="~amd64"
IUSE="static-libs"

RDEPEND="
	sci-physics/oneloop
	sci-physics/looptools
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_compile() {
	# single thread force needed since fortan mods depend on each other
	export MAKEOPTS=-j1
	default
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
