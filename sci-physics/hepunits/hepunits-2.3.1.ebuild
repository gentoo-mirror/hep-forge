EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1

DESCRIPTION="units and constants in the HEP system of units"
HOMEPAGE="https://github.com/scikit-hep/hepunits"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/attrs-19.2[${PYTHON_USEDEP}]
	>=sci-physics/hepunits-2.0.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
