EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Error propagation and statistical analysis for Markov chain Monte Carlos"
HOMEPAGE="
	https://github.com/fjoswig/pyerrors
	https://fjosw.github.io/pyerrors/pyerrors.html
	https://arxiv.org/abs/2209.14371
"
# pypi misses tests
SRC_URI="https://github.com/fjosw/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	>=dev-python/autograd-1.6.2[${PYTHON_USEDEP}]
	>=dev-python/numdifftools-0.9.41[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.7[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.10[${PYTHON_USEDEP}]
	>=dev-python/iminuit-2.21[${PYTHON_USEDEP}]
	>=dev-python/h5py-3.8[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.9[${PYTHON_USEDEP}]
	>=dev-python/python-rapidjson-1.10[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
	)
"

EPYTEST_IGNORE=(
	tests/benchmark_test.py
)

distutils_enable_tests pytest
