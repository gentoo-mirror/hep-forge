EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="pyhf plugin for spey interface"
HOMEPAGE="
	https://github.com/SpeysideHEP/spey-pyhf/
	https://speysidehep.github.io/spey-pyhf/
	https://arxiv.org/abs/2307.06996
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	~sci-physics/pyhf-0.7.3[${PYTHON_USEDEP}]
	>=sci-physics/spey-0.1.1[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
