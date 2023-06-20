EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="parallel graph management and execution in heterogeneous computing"
HOMEPAGE="https://github.com/uqfoundation/pathos"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dill-0.3.6[${PYTHON_USEDEP}]
	>=dev-python/multiprocess-0.70.14[${PYTHON_USEDEP}]
	>=dev-python/ppft-1.7.6.6[${PYTHON_USEDEP}]
	>=dev-python/pox-0.3.2[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
