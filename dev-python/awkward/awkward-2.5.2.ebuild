EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_USE_PEP517=hatchling
export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
inherit distutils-r1 pypi

DESCRIPTION="Manipulate JSON-like data with NumPy-like idioms."
HOMEPAGE="https://github.com/scikit-hep/awkward"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]
	~dev-python/awkward-cpp-28[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
    $(python_gen_cond_dep '
		dev-python/importlib_resources[${PYTHON_USEDEP}]
	' 3.8)
    $(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]
	' python3_{8..10})
"
BDEPEND="
	${RDEPEND}
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/fsspec[${PYTHON_USEDEP}]
		dev-python/jax[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		dev-python/numexpr[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		>=sci-physics/uproot-5[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest