EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1

DESCRIPTION="Manipulate JSON-like data with NumPy-like idioms."
HOMEPAGE="https://github.com/scikit-hep/uproot5"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.17.0[${PYTHON_USEDEP}]
	=dev-python/awkward_cpp-12[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
    $(python_gen_cond_dep '
		dev-python/importlib_resources[${PYTHON_USEDEP}]
	' 3.8)
    $(python_gen_cond_dep '
		>=dev-python/typing_extensions-4.1.0[${PYTHON_USEDEP}]
	' python3_{8..10})
"
BDEPEND="${RDEPEND}"