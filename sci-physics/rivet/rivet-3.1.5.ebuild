# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit python-single-r1 flag-o-matic autotools

MY_PN="Rivet"
MY_PF=${MY_PN}-${PV}

DESCRIPTION="Rivet toolkit (Robust Independent Validation of Experiment and Theory)"
HOMEPAGE="https://gitlab.com/hepcedar/rivet"
SRC_URI="https://www.hepforge.org/archive/rivet/${MY_PF}.tar.gz"
S=${WORKDIR}/${MY_PF}

LICENSE="GPL-3+"
SLOT="3"
KEYWORDS="~amd64"
IUSE="+hepmc3 hepmc2 +python"
REQUIRED_USE="
	^^ ( hepmc3 hepmc2 )
	python? ( ${PYTHON_REQUIRED_USE} )
"

RDEPEND="
	!python? ( >=sci-physics/yoda-1.9.5 )
	python? ( >=sci-physics/yoda-1.9.5[${PYTHON_SINGLE_USEDEP}] )
	>=sci-physics/fastjet-3.4.0[plugins]
	>=sci-physics/fastjet-contrib-1.046
	hepmc2? ( sci-physics/hepmc:0=[-cm(-),gev(+)] )
	hepmc3? ( sci-physics/hepmc:3=[-cm(-),gev(+)] )

	sci-libs/gsl

	app-text/ghostscript-gpl
	media-gfx/imagemagick
	virtual/latex-base

	>=dev-python/cython-0.29.24
	python? ( ${PYTHON_DEPS} )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

PATCHES=(
"${FILESDIR}"/${P}-test.patch
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# TODO does this affect more cpus?
	replace-cpu-flags znver1 x86-64
	PREFIX_YODA=$(yoda-config --prefix) || die
	PREFIX_FJ=$(fastjet-config --prefix) || die
	econf \
		$(use_enable python pyext) \
		$(usex hepmc2 "--with-hepmc=/usr" "") \
		$(usex hepmc3 "--with-hepmc3=/usr" "") \
		--with-yoda=$PREFIX_YODA \
		--with-fastjet=$PREFIX_FJ
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
