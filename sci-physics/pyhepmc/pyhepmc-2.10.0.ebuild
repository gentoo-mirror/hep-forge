EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A Pythonic wrapper for the HepMC3 C++ library."
HOMEPAGE="https://github.com/scikit-hep/pyhepmc"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
