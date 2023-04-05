EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Pandas integration with sklearn"
HOMEPAGE="https://github.com/scikit-learn-contrib/sklearn-pandas"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    >=sci-libs/scikit-learn-0.23.0[${PYTHON_USEDEP}]
    >=dev-python/scipy-1.5.1[${PYTHON_USEDEP}]
    >=dev-python/pandas-1.1.4[${PYTHON_USEDEP}]
    >=dev-python/numpy-1.18.1[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
