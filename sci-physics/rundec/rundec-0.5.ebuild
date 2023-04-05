EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="running and decoupling of the strong coupling constant and quark masses"
HOMEPAGE="https://github.com/DavidMStraub/rundec-python"
SRC_URI="https://github.com/DavidMStraub/rundec-python/archive/refs/tags/v${PV}.tar.gz"
S="${WORKDIR}/rundec-python-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="
    dev-lang/swig
    ${RDEPEND}
"

python_prepare_all() {
    swig -python -c++ -o _rundec.cc rundec.i || die
    distutils-r1_python_prepare_all
}