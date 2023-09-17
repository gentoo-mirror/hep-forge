# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="library for one-loop tensor integrals"
HOMEPAGE="https://github.com/Vayu/PJFry/"

SRC_URI="https://github.com/Vayu/PJFry/archive/refs/tags/v1.0.0-beta.10.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/PJFry-1.0.0-beta.10"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="oneloop +qcdloop"
# either oneloop or qcdloop
REQUIRED_USE="|| ( oneloop qcdloop )"

RDEPEND="
    oneloop? ( sci-physics/oneloop ) 
    qcdloop? ( >=sci-physics/qcdloop-2.0.0 ) 
"
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"

src_prepare() {
	default
    sed -i -e 's/mlink//g' Makefile.am || die
	eautoreconf
}

src_configure() {
    econf $(usex oneloop --with-integrals=oneloop) $(usex qcdloop --with-integrals=qcdloop2)
}

src_compile() {
    emake FFLAGS="-std=legacy ${FFLAGS}" LDFLAGS="-lgfortran"
}

src_install() {
    MAKEOPTS="$MAKEOPTS -j1" emake DESTDIR="${D}" install
}