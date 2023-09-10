EAPI=8
PYTHON_COMPAT=( python3_11 )

CMAKE_MAKEFILE_GENERATOR="emake"
DISTUTILS_USE_PEP517=scikit-build-core
PYPI_NO_NORMALIZE=1

inherit pypi distutils-r1

DESCRIPTION="awkward-cpp"
HOMEPAGE="https://github.com/scikit-hep/awkward/awkward-cpp"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	
	>=dev-python/numpy-1.17.0
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-python/scikit-build-core-0.2.0
"