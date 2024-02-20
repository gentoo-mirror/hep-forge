EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Lightweight Python interface to read Les Houches Event (LHE) files"
HOMEPAGE="https://github.com/scikit-hep/pylhe"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/graphviz-0.12.0[${PYTHON_USEDEP}]
	>=sci-physics/particle-0.16[${PYTHON_USEDEP}]
	>=dev-python/awkward-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/vector-0.8.1[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
