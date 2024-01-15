EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python bindings for the C++14 Boost::Histogram library"
HOMEPAGE="https://github.com/scikit-hep/boost-histogram"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

RDEPEND="
	dev-libs/boost[python,${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"
BDEPEND="${RDEPEND}"

src_prepare() {
	default
	sed -i 's/"pytest-benchmark"//g' pyproject.toml || die
}

distutils_enable_tests pytest

python_test() {
	# Remove benchmarks from tests
	local EPYTEST_IGNORE=(
		tests/test_benchmark_1d.py
		tests/test_benchmark_2d.py
		tests/test_benchmark_category_axis.py
		tests/test_pickle.py
		tests/test_threaded_fill.py
	)
	epytest
}
