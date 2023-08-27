EAPI=8

PYTHON_COMPAT=( python3_11 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Extended histogram plots on top of matplotlib and HEP compatible styling similar to current collaboration requirements (ROOT)."
HOMEPAGE="
    https://mplhep.readthedocs.io
    https://github.com/scikit-hep/mplhep
"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/matplotlib-3.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16.0[${PYTHON_USEDEP}]
	sci-physics/mplhep-data[${PYTHON_USEDEP}]
	>=dev-python/uhi-0.2.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
