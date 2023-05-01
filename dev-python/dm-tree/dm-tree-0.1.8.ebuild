EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="tree is a library for working with nested data structures."
HOMEPAGE="https://github.com/deepmind/tree"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="
	dev-util/cmake
	${RDEPEND}
"
