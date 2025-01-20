EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="PyQgraf is a Python wrapper for Qgraf, a Feynman diagram generator."
HOMEPAGE="
    https://github.com/APN-Pucky/pygraf
    https://pypi.org/project/pyqgraf/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    <sci-physics/qgraf-4
	dev-python/smpl_io[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
    dev-python/scikit-build[${PYTHON_USEDEP}]
"
BDEPEND="
    dev-python/hatch-vcs[${PYTHON_USEDEP}]
"