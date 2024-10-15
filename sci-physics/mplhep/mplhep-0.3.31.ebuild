EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Histogram plots using matplotlib and HEP compatible styling ROOT."
HOMEPAGE="
	https://mplhep.readthedocs.io
	https://github.com/scikit-hep/mplhep
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64" # because of scrapbook

RDEPEND="
	>=dev-python/matplotlib-3.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16.0[${PYTHON_USEDEP}]
	sci-physics/mplhep-data[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/uhi-0.2.0[${PYTHON_USEDEP}]

	test? (
		>=dev-python/papermill-1.0[${PYTHON_USEDEP}]
		>=dev-python/scrapbook-0.3[${PYTHON_USEDEP}]

		>=dev-python/scipy-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/pytest-mpl[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]

		sci-physics/uproot[${PYTHON_USEDEP}]
		dev-python/hist[${PYTHON_USEDEP}]
		dev-python/boost-histogram[${PYTHON_USEDEP}]
		sci-physics/scikit-hep-testdata[${PYTHON_USEDEP}]
	)
"
BDEPEND="${RDEPEND}"

distutils_enable_tests pytest
