EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Vector classes and utilities"
HOMEPAGE="https://github.com/scikit-hep/vector"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

RDEPEND="
	>=dev-python/numpy-1.13.3[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
