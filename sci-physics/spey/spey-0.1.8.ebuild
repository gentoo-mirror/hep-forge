EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Smooth inference for reinterpretation studies"
HOMEPAGE="
	https://github.com/SpeysideHEP/spey/
	https://spey.readthedocs.io/
	https://arxiv.org/abs/2307.06996
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.21.6[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/autograd-1.5[${PYTHON_USEDEP}]
	>=dev-python/semantic-version-2.10[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.64.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
