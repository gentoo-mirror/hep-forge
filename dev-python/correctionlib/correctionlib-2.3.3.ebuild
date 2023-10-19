EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A generic correction library"
HOMEPAGE="https://github.com/cms-nanoAOD/correctionlib/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.13.3[${PYTHON_USEDEP}]
	<dev-python/pydantic-2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.7.3[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
