# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="NJet is a library for multi-parton matrix elements up to two loops in massless QCD"
HOMEPAGE="https://bitbucket.org/njet/njet"

SRC_URI="https://bitbucket.org/njet/njet/downloads/${P}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    sci-physics/qcdloop
    sci-libs/qd
"
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"

src_configure() {
	econf $(use_enable root)
}

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" install
}