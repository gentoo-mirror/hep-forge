
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="A parton level Monte Carlo for processes wit electroweak bosons"
HOMEPAGE="https://www.itp.kit.edu/vbfnlo/wiki/doku.php"

SRC_URI="https://github.com/vbfnlo/vbfnlo/archive/refs/tags/v3.0.0beta5.tar.gz -> ${P}.tar.gz" # weird hepforge download names
S="${WORKDIR}/vbfnlo-3.0.0beta5"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="root looptools hepmc lhapdf quad mpi kk" 

RDEPEND="
    sci-libs/gsl 
    looptools? ( sci-physics/looptools )
    hepmc? ( sci-physics/hepmc:2= )
	root? ( sci-physics/root )
	lhapdf? ( sci-physics/lhapdf )
"
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"

src_prepare() {
    default
    sed -i -e 's#.*doc/Makefile.*##' configure.ac
    sed -i -e 's#doc##' Makefile.am
    eautoreconf
}

src_configure() {
	econf FCFLAGS="-std=legacy" \
        --enable-processes=all \
        $(use_enable mpi) \
        $(use_enable kk) \
        $(use_enable quad) \
        $(use_with looptools ) \
        $(use_with hepmc ) \
        $(use_with root) \
        $(use_with lhapdf)
}