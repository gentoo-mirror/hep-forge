EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python bindings for the C++14 Boost::Histogram library "
HOMEPAGE="https://github.com/scikit-hep/boost-histogram"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    dev-libs/boost[python,${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
