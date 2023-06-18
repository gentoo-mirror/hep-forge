EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1 pypi

DESCRIPTION="Cachy provides a simple yet effective caching library."
HOMEPAGE="
	https://github.com/sdispater/cachy
	https://pypi.org/project/cachy/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="${RDEPEND}"