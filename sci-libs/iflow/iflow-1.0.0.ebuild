EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="multi-dimensional integration and sampling"
HOMEPAGE="https://gitlab.com/i-flow/i-flow"
SRC_URI="https://gitlab.com/i-flow/i-flow/-/archive/v1.0/i-flow-v1.0.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=sci-libs/tensorflow-2.0[${PYTHON_USEDEP}]
	>=sci-libs/tensorflow_probability-0.8.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
