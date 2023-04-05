EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="deal with CKM and PMNS matrices"
HOMEPAGE="https://github.com/DavidMStraub/ckmutil"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
