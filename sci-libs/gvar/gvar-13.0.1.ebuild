EAPI=8


DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Gaussian random variables."
HOMEPAGE="https://github.com/gplepage/gvar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm ~riscv"

RDEPEND="
	>=dev-python/cython-0.17[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

python_prepare_all() {
	sed -i 's/USE_CYTHON = False/USE_CYTHON = True/' setup.py || die
	distutils-r1_python_prepare_all
}

python_compile_all() {
	#default
	find "${BUILD_DIR}" -type f -name "gvar.pxd" -exec rm {} \; || die
}
