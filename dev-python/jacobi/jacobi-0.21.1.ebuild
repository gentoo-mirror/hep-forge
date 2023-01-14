EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Numerical derivatives for analytic functions with arbitrary round-off error and error propagation."
HOMEPAGE="https://github.com/scikit-hep/particle"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.10[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
