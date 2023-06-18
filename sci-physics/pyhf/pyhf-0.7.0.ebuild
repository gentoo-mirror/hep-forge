EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
#DISTUTILS_USE_PEP517=hatchling
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="pure-python fitting/limit-setting/interval estimation HistFactory-style"
HOMEPAGE="https://github.com/scikit-hep/pyhf"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.56.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.15.0[${PYTHON_USEDEP}]
	>=dev-python/jsonpatch-1.15[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
