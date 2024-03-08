EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Adaptive multidimensional Monte Carlo integration."
HOMEPAGE="https://github.com/gplepage/vegas"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

RDEPEND="
	>=dev-python/cython-0.17[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16[${PYTHON_USEDEP}]
	>=sci-libs/gvar-12.1[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

python_prepare_all() {
	sed -i 's/USE_CYTHON = False/USE_CYTHON = True/' setup.py || die
	# Don't add pxd files to the package data
	sed -i "s|'../vegas.pxd',||" setup.py || die
	distutils-r1_python_prepare_all
}
