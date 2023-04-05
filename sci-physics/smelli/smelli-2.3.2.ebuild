EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="running and matching beyond the Standard Model"
HOMEPAGE="https://github.com/wilson-eft/wilsonHDembinski/jacobi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

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
