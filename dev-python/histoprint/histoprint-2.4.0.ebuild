EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Pretty print histograms to the console"
HOMEPAGE="https://github.com/scikit-hep/histoprint"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/click-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/uhi-0.2.1[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"