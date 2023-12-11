EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit python-single-r1 cmake

DESCRIPTION="A PDF Evolution Library"
HOMEPAGE="
	https://apfel.hepforge.org/
	https://apfel.mi.infn.it/
	https://github.com/scarrazza/apfel
"
SRC_URI="https://github.com/scarrazza/apfel/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3+"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"
IUSE="+lhapdf +python test"
RESTRICT="!test? ( test )"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="
	python? ( ${PYTHON_DEPS} )
	test? ( sci-physics/lhapdf-sets[lhapdf_sets_nnpdf23_nlo_as_0118,lhapdf_sets_nnpdf31_nnlo_as_0118] )
	
	lhapdf? ( $(python_gen_cond_dep '
		sci-physics/lhapdf[${PYTHON_USEDEP}] 
	') )
"
DEPEND="${RDEPEND}"
BDEPEND="
	python? ( dev-lang/swig )
	virtual/fortran
"

src_configure() {
	local mycmakeargs=(
		-DAPFEL_ENABLE_PYTHON="$(usex python ON OFF)"
		-DAPFEL_ENABLE_LHAPDF="$(usex lhapdf ON OFF)"
		-DAPFEL_ENABLE_TESTS="$(usex test ON OFF)"
	)
	cmake_src_configure
}


src_compile() {
	default
}

src_install() {
	default
	use python && python_optimize
	find "${ED}" -name '*.la' -delete || die
}
