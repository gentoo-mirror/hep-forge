EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Histogramming for analysis powered by boost-histogram "
HOMEPAGE="https://github.com/scikit-hep/hist"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

RDEPEND="
	>=dev-python/boost-histogram-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/histoprint-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.14.5[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
