# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Higher Order Perturbative Parton Evolution Toolkit"
HOMEPAGE="
    https://hoppet.hepforge.org/
    https://github.com/gavinsalam/hoppet
"
SRC_URI="https://hoppet.hepforge.org/downloads/${P}.tgz"

SLOT="0"
LICENSE="GPL-3+"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
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
	econf FCFLAGS="${FCFLAGS} -std=legacy -fPIC -I${ESYSROOT}/usr/include"
	# fix old vs new oneloop parameters
	sed -i 's/avh_olo_kinds/avh_olo_dp_kinds/g' samurai/madds.f90 || die
}

src_compile() {
	emake
}

src_install() {
	emake install
    emake install-mod
	find "${ED}" -name '*.la' -delete || die
}
