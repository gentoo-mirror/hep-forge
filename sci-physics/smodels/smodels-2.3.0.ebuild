EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A tool for interpreting simplified-model results from the LHC."
HOMEPAGE="https://github.com/SModelS/smodels"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# TODO add NLL-fast?!
RDEPEND="
	>=sci-physics/pythia-8.3.0
	>=dev-python/docutils-0.3[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.13.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/Unum-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=sci-physics/pyslha-3.1.0[${PYTHON_USEDEP}]
	>=sci-physics/pyhf-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/jsonpatch-1.25[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.2.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
