
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="Resummation for squarks and gluinos"
HOMEPAGE="https://dyturbo.hepforge.org/downloads?f=${P}.tar.gz"

SRC_URI="https://www.uni-muenster.de/Physik.TP/~akule_01/nnllfast/lib/exe/fetch.php?media=nllfast-3.1-13tev.tar.bz2 -> ${P}.tar.gz"
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="root"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"

src_prepare() {
    sed -i -e "s#\"(.*\.grid)\"#\"${EPREFIX}/usr/share/nll-fast-${PV}/\1\"#g" nllfast*.f
}

src_compile() {
	${FC} nllfast*.f -o nll-fast-${PV}
}

src_install() {
    insinto /usr/share/nll-fast-${PV}
    doins *.grid
}