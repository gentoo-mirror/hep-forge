EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A tool for interpreting simplified-model results from the LHC."
HOMEPAGE="https://github.com/SModelS/smodels"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    dev-python/numpy[${PYTHON_USEDEP}]
    >=sci-libs/tensorflow-2.0[${PYTHON_USEDEP}]
    >=sci-libs/tensorflow_probability-0.8.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
