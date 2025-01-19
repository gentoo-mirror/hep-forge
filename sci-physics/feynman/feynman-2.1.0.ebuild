EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Feynman diagrams in matplotlib."
HOMEPAGE="
    https://github.com/GkAntonius/feynman
    https://pypi.org/project/feynman/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"

PATCHES=(
    "${FILESDIR}/${P}"-license.patch
)