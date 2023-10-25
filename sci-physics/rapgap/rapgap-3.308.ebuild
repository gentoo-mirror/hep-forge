
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="Hadron level Monte Carlo generator for ep and selected processes in pp scattering"
HOMEPAGE="
	https://rapgap.hepforge.org/
	https://gitlab.cern.ch/jung/rapgap
"

SRC_URI="https://rapgap.hepforge.org/downloads/?f=${P}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=sci-physics/hepmc-2.06.09:2
	>=sci-physics/lhapdf-6.2.1
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
	econf \
		--with-hepmc=${ESYSROOT}/usr/$(get_libdir)/ \
		--with-lhapdf6=${ESYSROOT}/usr/$(get_libdir)/
}