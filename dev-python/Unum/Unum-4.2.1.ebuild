EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="units in python"
HOMEPAGE="
    https://bitbucket.org/lukaszlaba/unum
    https://unum.readthedocs.io/en/latest/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

PATCHES=(
    "${FILESDIR}/${P}-no-install-test.patch"
)

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="${RDEPEND}"
