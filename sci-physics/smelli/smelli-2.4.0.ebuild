EAPI=8

PYTHON_COMPAT=( python3_11 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="running and matching beyond the Standard Model"
HOMEPAGE="https://github.com/wilson-eft/wilsonHDembinski/jacobi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.16.5[${PYTHON_USEDEP}]
    >=sci-physics/flavio-2.3.1[${PYTHON_USEDEP}]
    sci-physics/wilson[${PYTHON_USEDEP}]
    dev-python/pandas[${PYTHON_USEDEP}]
    dev-python/multipledispatch[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
