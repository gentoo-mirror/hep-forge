
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
    echo "#/bin/bash" > nnll-fast-${PV}
    echo "cd ${EPREFIX}/usr/share/nnll-fast-${PV}/bin" >> nnll-fast-${PV}
    echo "./a.out" >> nnll-fast-${PV}
    chmod +x nnll-fast-${PV}
}

src_compile() {
    tc-export FC
	${FC} ${FFLAGS} nnllfast*.f
}

src_install() {
    dobin nnll-fast-${PV}
    insinto /usr/share/nnll-fast-${PV}/bin
    doins *.grid
    into /usr/share/nnll-fast-${PV}
    dobin a.out
    
}