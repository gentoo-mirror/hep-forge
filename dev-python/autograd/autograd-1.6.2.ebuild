EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Efficiently computes derivatives of numpy code."
HOMEPAGE="
    https://github.com/HIPS/autograd
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.12[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
