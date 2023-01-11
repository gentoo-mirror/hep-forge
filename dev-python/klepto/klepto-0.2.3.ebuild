EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="persistent caching to memory, disk, or database"
HOMEPAGE="https://github.com/uqfoundation/klepto"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dill-0.3.6[${PYTHON_USEDEP}]
    >=dev-python/pox-0.3.2[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
