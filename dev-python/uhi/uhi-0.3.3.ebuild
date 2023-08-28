EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Universal Histogram Interface"
HOMEPAGE="https://github.com/scikit-hep/uhi"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
