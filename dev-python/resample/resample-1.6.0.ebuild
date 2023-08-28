EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Randomization-based inference in Python"
HOMEPAGE="https://github.com/scikit-hep/resample"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.21[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.110${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
