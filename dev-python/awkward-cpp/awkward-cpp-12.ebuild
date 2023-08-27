EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="awkward-cpp"
HOMEPAGE="https://github.com/scikit-hep/awkward/awkward-cpp"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/numpy-1.17.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
