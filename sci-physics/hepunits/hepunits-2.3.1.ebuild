EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="units and constants in the HEP system of units"
HOMEPAGE="https://github.com/scikit-hep/hepunits"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/attrs-19.2[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
