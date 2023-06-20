EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="running and matching beyond the Standard Model"
HOMEPAGE="https://github.com/wilson-eft/wilson"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.16.5[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.0.0[${PYTHON_USEDEP}]
    dev-python/pandas[${PYTHON_USEDEP}]
    >=sci-physics/pylha-0.2[${PYTHON_USEDEP}]
    dev-python/pyyaml[${PYTHON_USEDEP}]
    >=sci-physics/ckmutil-0.3.2[${PYTHON_USEDEP}]
    >=sci-physics/rundec-0.5[${PYTHON_USEDEP}]
    dev-python/voluptuous[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
