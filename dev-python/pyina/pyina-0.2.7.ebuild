EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="MPI parallel map and cluster scheduling"
HOMEPAGE="https://github.com/uqfoundation/pyina"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dill-0.3.6[${PYTHON_USEDEP}]
    >=dev-python/pox-0.3.2[${PYTHON_USEDEP}]
    >=dev-python/sympy-0.6.7[${PYTHON_USEDEP}]
    >=dev-python/numpy-1.0[${PYTHON_USEDEP}]
    >=dev-python/pathos-0.3.0[${PYTHON_USEDEP}]
    >=dev-python/mpi4py-1.3[${PYTHON_USEDEP}]
    >=dev-python/pathos-0.3.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
RDEPEND="virtual/mpi"
