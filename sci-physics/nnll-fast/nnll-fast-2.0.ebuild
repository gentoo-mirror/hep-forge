
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit toolchain-funcs

DESCRIPTION="Resummation for squarks and gluinos"
HOMEPAGE="https://www.uni-muenster.de/Physik.TP/~akule_01/nnllfast/doku.php?id=start"

SRC_URI="https://www.uni-muenster.de/Physik.TP/~akule_01/nnllfast/lib/exe/fetch.php?media=nnllfast-2.0.tar.bz2 -> ${P}.tar.bz2"
S="${WORKDIR}/nnllfast-${PV}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"

src_prepare() {
    default
    sed -i -e "s#\"\(.*\.grid\)\"#\"${EPREFIX}/usr/share/nnll-fast-${PV}\n     1/\1\"#g" nnllfast*.f
}

src_compile() {
    tc-export FC
	${FC} ${FFLAGS} ${FCFLAGS} nnllfast*.f -o nnll-fast-${PV}
}

src_install() {
    insinto /usr/share/nnll-fast-${PV}
    doins *.grid
    dobin nnll-fast-${PV}
}