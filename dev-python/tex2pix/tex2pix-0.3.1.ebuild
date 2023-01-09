EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Lightweight renderer of LaTeX to a variety of graphics formats"
HOMEPAGE="https://pypi.org/project/tex2pix/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="${RDEPEND}"
