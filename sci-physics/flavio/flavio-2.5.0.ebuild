EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="flavour phenomenology in the Standard model and beyond"
HOMEPAGE="https://github.com/flav-io/flavio"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	sci-physics/ckmutil[${PYTHON_USEDEP}]
	>=sci-physics/wilson-2.0.0[${PYTHON_USEDEP}]
	>=sci-physics/parton-0.2.1[${PYTHON_USEDEP}]
	>=sci-physics/particle-0.16.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
