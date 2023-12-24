EAPI=8

PYTHON_COMPAT=( python3_{10..11} )

inherit cmake python-single-r1

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
IUSE="+python test"
RESTRICT="!test? ( test )"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"
RDEPEND="
	python? ( ${PYTHON_DEPS} )
	test? ( sci-physics/lhapdf-sets[lhapdf_sets_nnpdf23_nlo_as_0118,lhapdf_sets_nnpdf31_nnlo_as_0118] )
	sci-physics/lhapdf
"
DEPEND="${RDEPEND}"
BDEPEND="
	python? ( dev-lang/swig )
	virtual/fortran
"

pkg_setup() {
    use python && python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DAPFEL_ENABLE_PYTHON="$(usex python ON OFF)"
		-DAPFEL_DOWNLOAD_PDFS=OFF
		-DAPFEL_ENABLE_LHAPDF=ON
		-DAPFEL_ENABLE_TESTS="$(usex test ON OFF)"
	)
	cmake_src_configure
}


src_compile() {
	cmake_src_compile
}

src_install() {
	use python && python_optimize
	find "${ED}" -name '*.la' -delete || die
	cmake_src_install
}
