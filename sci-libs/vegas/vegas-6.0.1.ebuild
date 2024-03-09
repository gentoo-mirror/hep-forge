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
	>=sci-libs/gvar-13.0.1[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
