EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Gaussian random variables."
HOMEPAGE="https://github.com/gplepage/gvar"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    >=dev-python/cython-0.17[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

python_prepare_all() {
    sed -i 's/USE_CYTHON = False/USE_CYTHON = True/' setup.py || die
    # Don't add pxd files to the package data
    sed -i "s|'../gvar.pxd',||" setup.py || die
    distutils-r1_python_prepare_all
}