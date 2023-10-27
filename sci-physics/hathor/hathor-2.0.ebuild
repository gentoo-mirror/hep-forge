# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

MY_PN="Hathor"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="HAdronic Top and Heavy quarks crOss section calculatoR"
HOMEPAGE="https://www.physik.hu-berlin.de/de/pep/tools/hathor.html"

SRC_URI="https://www.physik.hu-berlin.de/de/pep/tools/Hathor-${PV}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
S="${WORKDIR}/${MY_P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
    sci-physics/lhapdf
"
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"

src_compile() {
    emake -C lib LHAPDF="${EPREFIX}"/usr V=1 CFLAGS="${CFLAGS} -Wall -fPIC" FFLAGS="${FFLAGS} -ffixed-line-length-132 -fPIC -std=legacy"
}

src_install() {
    dolib.a lib/libHathor.a
    dolib.a lib/libff.a
}