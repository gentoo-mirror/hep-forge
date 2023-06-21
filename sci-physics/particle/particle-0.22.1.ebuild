EAPI=8

PYTHON_COMPAT=( python3_11 )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="PDG particle data and identification codes"
HOMEPAGE="https://github.com/scikit-hep/particle"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/attrs-19.2[${PYTHON_USEDEP}]
	>=sci-physics/hepunits-2.0.0[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/importlib_resources-2.0.0[${PYTHON_USEDEP}]
	' python3_{7..8})
	$(python_gen_cond_dep '
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	' python3_7)
	test? (
		>=dev-python/pytest-6.0.0[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
	)
"
BDEPEND="${RDEPEND}"
distutils_enable_tests pytest
