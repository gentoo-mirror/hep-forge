# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit python-single-r1 flag-o-matic autotools optfeature

MY_PN="Rivet"
MY_PF=${MY_PN}-${PV}

DESCRIPTION="Rivet toolkit (Robust Independent Validation of Experiment and Theory)"
HOMEPAGE="
	https://rivet.hepforge.org/
	https://gitlab.com/hepcedar/rivet
"
SRC_URI="https://www.hepforge.org/archive/rivet/${MY_PF}.tar.gz"
S=${WORKDIR}/${MY_PF}

LICENSE="GPL-3+"
SLOT="3"
KEYWORDS="~amd64"
IUSE="+hepmc3 hepmc2"
REQUIRED_USE="
	^^ ( hepmc3 hepmc2 )
	${PYTHON_REQUIRED_USE}
"

RDEPEND="
	>=sci-physics/yoda-1.9.5[python(-),${PYTHON_SINGLE_USEDEP}]
	>=sci-physics/fastjet-3.4.0[plugins]
	>=sci-physics/fastjet-contrib-1.048
	hepmc2? ( sci-physics/hepmc:2=[-cm(-),gev(+)] )
	hepmc3? ( sci-physics/hepmc:3=[-cm(-),gev(+)] )

	sci-libs/gsl

	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
	>=dev-python/cython-0.29.24
"

PATCHES=(
	"${FILESDIR}"/${PN}-3.1.6-binreloc.patch
	"${FILESDIR}"/${P}-ldflags.patch
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# Eigen complains about alignment (see https://gitlab.com/libeigen/eigen/-/issues/2523).
	# does this affect more cpus?
	replace-cpu-flags znver1 x86-64
	econf \
		$(usex hepmc2 "--with-hepmc=${EROOT}/usr" "") \
		$(usex hepmc3 "--with-hepmc3=${EROOT}/usr" "") \
		--with-yoda="${EROOT}/usr" \
		--with-fastjet="${EROOT}/usr"
}

src_install() {
	default
	python_optimize
	find "${ED}" -name '*.la' -delete || die
}

pkg_postinstall() {
	optfeature "plotting support" 	virtual/latex-base	media-gfx/imagemagick	app-text/ghostscript-gpl
}
