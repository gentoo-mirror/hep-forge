EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="highly-constrained non-convex optimization and uncertainty quantification"
HOMEPAGE="https://github.com/uqfoundation/mystic"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dill-0.3.6[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.0[${PYTHON_USEDEP}]
	>=dev-python/sympy-0.6.7[${PYTHON_USEDEP}]
	>=dev-python/mpmath-0.19[${PYTHON_USEDEP}]
	>=dev-python/klepto-0.2.3[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
