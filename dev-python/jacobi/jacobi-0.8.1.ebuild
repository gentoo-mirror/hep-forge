EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Numerical derivatives for analytic functions with arbitrary round-off error and error propagation."
HOMEPAGE="https://github.com/HDembinski/jacobi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.10[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
