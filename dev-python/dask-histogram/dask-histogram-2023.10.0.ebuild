EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION=" Histograms with task scheduling."
HOMEPAGE="https://github.com/dask-contrib/dask-histogram"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/boost-histogram-1.3.2[${PYTHON_USEDEP}]
	>=dev-python/dask-2021.03.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"