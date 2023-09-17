
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit fortran-2

DESCRIPTION="A library for evaluating one-loop integrals"
HOMEPAGE="https://www.nikhef.nl//~t68/ff/"

SRC_URI="http://www.nikhef.nl/~t68/ff/ff.tar.gz -> ${P}.tar.gz" # weird hepforge download names
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" install
}