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
    dev-python/absl-py
    >=dev-python/six-1.10.0
    >=dev-python/numpy-1.13.3
    dev-python/decorator
    >=dev-python/cloudpickle-1.3
    >=dev-python/gast-0.3.2
    dev-python/dm-tree
"
BDEPEND="${RDEPEND}"
