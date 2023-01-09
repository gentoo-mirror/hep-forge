# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Scattering AMplitudes from Unitarity-based Reduction Algorithm at the Integrand level."
HOMEPAGE="https://samurai.hepforge.org/"
SRC_URI="http://www.hepforge.org/archive/samurai/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="3"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-physics/qcdloop
	>=sci-physics/oneloop
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
	default
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
