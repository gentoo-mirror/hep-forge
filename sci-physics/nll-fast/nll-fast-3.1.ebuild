
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit toolchain-funcs

DESCRIPTION="Resummation for squarks and gluinos"
HOMEPAGE="https://www.uni-muenster.de/Physik.TP/~akule_01/nnllfast/doku.php?id=nllfast"

SRC_URI="https://www.uni-muenster.de/Physik.TP/~akule_01/nnllfast/lib/exe/fetch.php?media=nllfast-3.1-13tev.tar.bz2 -> ${P}.tar.bz2"
S="${WORKDIR}/"
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
    echo "#/bin/bash" > nll-fast-${PV}
    echo "cd ${EPREFIX}/usr/share/nll-fast-${PV}/bin" >> nll-fast-${PV}
    echo './a.out "$@"' >> nll-fast-${PV}
    chmod +x nll-fast-${PV}
}

src_compile() {
    tc-export FC
	${FC} ${FFLAGS} nllfast*.f 
}

src_install() {
    dobin nll-fast-${PV}
    insinto /usr/share/nll-fast-${PV}/bin
    doins *.grid
    into /usr/share/nll-fast-${PV}
    dobin a.out
}