# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

DESCRIPTION="Quickly reproduce NLO calculations with any input PDFs"
HOMEPAGE="
	https://applgrid.hepforge.org/
"
SRC_URI="https://applgrid.hepforge.org/downloads?f=${P}.tgz -> ${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="root"
DEPEND="
	root? ( sci-physics/root )
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/${P}-iterator.patch
)

src_configure() {
	default
	econf --prefix="${EPREFIX}"/usr $(use_with root)
}

pkg_postinst() {
	optfeature "hoppet support" sci-physics/hoppet
	optfeature "lhapdf support" sci-physics/lhapdf
}
