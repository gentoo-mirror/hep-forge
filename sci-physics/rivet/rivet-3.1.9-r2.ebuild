# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

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
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"
IUSE="+hepmc3 hepmc2 +zlib +python"
REQUIRED_USE="
	^^ ( hepmc3 hepmc2 )
	python? ( ${PYTHON_REQUIRED_USE} )
"

RDEPEND="
	python? (
		>=sci-physics/yoda-1.9.8[${PYTHON_SINGLE_USEDEP}]
		<sci-physics/yoda-2[${PYTHON_SINGLE_USEDEP}]
	)
	!python? (
		>=sci-physics/yoda-1.9.8
		<sci-physics/yoda-2
	)
	>=sci-physics/fastjet-3.4.0[plugins]
	>=sci-physics/fastjet-contrib-1.048
	hepmc2? ( sci-physics/hepmc:2=[-cm(-),gev(+)] )
	hepmc3? ( <sci-physics/hepmc-3.2.7:3=[-cm(-),gev(+)] )

	sci-libs/gsl
	zlib? ( sys-libs/zlib )
	python? (
		$(python_gen_cond_dep '
			>=dev-python/cython-0.19[${PYTHON_USEDEP}]
			dev-python/matplotlib[${PYTHON_USEDEP}]
		')
		${PYTHON_DEPS}
	)
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
	python? (
		>=dev-python/cython-0.29.24
	)
"

PATCHES=(
	"${FILESDIR}"/${PN}-3.1.6-binreloc.patch
)

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	replace-cpu-flags znver1 x86-64
	econf \
		$(use_with zlib zlib "${ESYSROOT}/usr") \
		$(usex hepmc2 "--with-hepmc=${ESYSROOT}/usr" "") \
		$(usex hepmc3 "--with-hepmc3=${ESYSROOT}/usr" "") \
		--with-yoda="${ESYSROOT}/usr" \
		--with-fastjet="${ESYSROOT}/usr" \
		$(use_enable python pyext) \
		$(use_enable python CYTHON="${ESYSROOT}/usr/bin/cython")
}

src_install() {
	default
	use python && python_optimize
	find "${ED}" -name '*.la' -delete || die
}

pkg_postinstall() {
	optfeature "plotting support" virtual/latex-base media-gfx/imagemagick app-text/ghostscript-gpl
}
