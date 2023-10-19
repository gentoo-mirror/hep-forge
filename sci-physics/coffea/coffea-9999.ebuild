EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 

DESCRIPTION="Basic tools and wrappers for enabling not-too-alien syntax when running columnar Collider HEP analysis."
HOMEPAGE="
	https://github.com/CoffeaTeam/coffea
	https://coffeateam.github.io/coffea/
"

LICENSE="BSD"
SLOT="0"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/CoffeaTeam/coffea/"
else
	inherit pypi
    KEYWORDS="~amd64"
fi

RDEPEND="
	>=dev-python/awkward-2.4.6[${PYTHON_USEDEP}]
	>=sci-physics/uproot-5.1.1[${PYTHON_USEDEP}]
	>=dev-python/dask-2023.4.0[${PYTHON_USEDEP}]
	>=dev-python/dask-awkward-2023.4.0[${PYTHON_USEDEP}]
	>=dev-python/dask-histogram-2023.4.0[${PYTHON_USEDEP}]
	>=dev-python/correctionlib-2.3.3[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-6.0.0[${PYTHON_USEDEP}]
	dev-python/fsspec[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/numba-0.58.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22.0[${PYTHON_USEDEP}]
	<dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.27.0[${PYTHON_USEDEP}]
	dev-python/lz4[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-1.2.3[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
	>=sci-physics/mplhep-0.1.18[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	>=dev-python/hist-2.0.0[${PYTHON_USEDEP}]
	dev-python/cachetools[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"