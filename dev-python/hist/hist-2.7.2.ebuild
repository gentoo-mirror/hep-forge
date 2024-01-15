EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=hatchling
export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
inherit distutils-r1 pypi

DESCRIPTION="Histogramming for analysis powered by boost-histogram "
HOMEPAGE="https://github.com/scikit-hep/hist"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

RDEPEND="
	>=dev-python/boost-histogram-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/histoprint-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.14.5[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"
