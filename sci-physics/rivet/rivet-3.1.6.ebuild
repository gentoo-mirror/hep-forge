# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit bash-completion-r1 autotools python-single-r1 flag-o-matic

MY_PN="Rivet"
MY_PF=${MY_PN}-${PV}

DESCRIPTION="Rivet toolkit (Robust Independent Validation of Experiment and Theory)"
HOMEPAGE="https://gitlab.com/hepcedar/rivet"
SRC_URI="http://www.hepforge.org/archive/rivet/${MY_PF}.tar.gz"
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
	>=sci-physics/fastjet-contrib-1.048
	>=dev-python/cython-0.29.24
	hepmc2? ( sci-physics/hepmc:0=[-cm(-),gev(+)] )
	hepmc3? ( sci-physics/hepmc:3=[-cm(-),gev(+)] )

	sci-libs/gsl
	# dependencies used for plotting in rivet
	app-text/ghostscript-gpl 
	media-gfx/imagemagick
	virtual/latex-base

	python? ( ${PYTHON_DEPS} )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

PATCHES=(
"${FILESDIR}"/${P}-binreloc.patch
"${FILESDIR}"/${P}-std.patch
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	append-cxxflags -std=c++17
	append-cppflags -std=c++17
	PREFIX_YODA=$(yoda-config --prefix) || die
	PREFIX_FJ=$(fastjet-config --prefix) || die
	# Rivet does not like econf for some reason
	econf \
		$(use_enable python pyext) \
		$(usex hepmc2 "--with-hepmc=/usr" "") \
		$(usex hepmc3 "--with-hepmc3=/usr" "") \
		--with-yoda=$PREFIX_YODA \
		--with-fastjet=$PREFIX_FJ
}

src_install() {
	# Needed before for default configure instead of econf
	#newbashcomp "${ED}"/usr/etc/bash_completion.d/${PN}-completion ${PN}
	#rm "${ED}"/usr/etc/bash_completion.d/${PN}-completion || die

	default

	find "${ED}" -name '*.la' -delete || die
}
