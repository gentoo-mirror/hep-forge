
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit fortran-2 autotools

MY_PV=$(ver_cut 1-2)
MY_P=${PN}-${MY_PV}

DESCRIPTION="A parton level Monte Carlo for processes wit electroweak bosons"
HOMEPAGE="
	https://ific.uv.es/vbfnlo/index.html
	https://www.itp.kit.edu/vbfnlo/wiki/doku.php
	https://github.com/vbfnlo/vbfnlo
	https://arxiv.org/abs/2405.06990
"

SRC_URI="https://ific.uv.es/vbfnlo/archive/${MY_P}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="root looptools hepmc2 +lhapdf quad mpi kk"

RDEPEND="
	sci-libs/gsl
	looptools? ( sci-physics/looptools )
	hepmc2? ( sci-physics/hepmc:2= )
	root? ( sci-physics/root )
	lhapdf? ( sci-physics/lhapdf )
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	sed -i -e 's#.*doc/Makefile.*##' configure.ac
	sed -i -e 's#doc##' Makefile.am
	eautoreconf
}

src_configure() {
	econf FCFLAGS="${FCFLAGS} -std=legacy" \
		--enable-processes=all \
		$(use_enable mpi) \
		$(use_enable kk) \
		$(use_enable quad) \
		$(use_with looptools) \
		$(use_with hepmc2 hepmc) \
		$(use_with root) \
		$(use_with lhapdf)
}
