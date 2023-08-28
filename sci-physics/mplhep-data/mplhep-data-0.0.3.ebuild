EAPI=8

PYTHON_COMPAT=( python3_11 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Sub-package to hold data (fonts) for mplhep."
HOMEPAGE="
    https://github.com/scikit-hep/mplhep_data
"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="${RDEPEND}"
