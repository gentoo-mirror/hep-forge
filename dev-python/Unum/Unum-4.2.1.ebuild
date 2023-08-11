EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="units in python"
HOMEPAGE="
	https://bitbucket.org/lukaszlaba/unum
	https://unum.readthedocs.io/en/latest/
"

PATCHES=(
	"${FILESDIR}/${P}-no-install-test.patch"
)

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="${RDEPEND}"
