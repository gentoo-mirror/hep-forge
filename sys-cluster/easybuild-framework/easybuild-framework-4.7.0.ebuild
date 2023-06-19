EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="The easybuild-framework package is the core of EasyBuild."
HOMEPAGE="
	https://easybuild.io/
	https://github.com/easybuilders/easybuild-framework
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
dev-python/flake8[${PYTHON_USEDEP}]
dev-python/keyring[${PYTHON_USEDEP}]
dev-python/GitPython[${PYTHON_USEDEP}]
dev-python/pyyaml[${PYTHON_USEDEP}]
dev-python/autopep8[${PYTHON_USEDEP}]
dev-python/requests[${PYTHON_USEDEP}]
dev-python/cryptography[${PYTHON_USEDEP}]
dev-python/rich[${PYTHON_USEDEP}]
dev-python/archspec[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-4.6.2-test.patch
)
