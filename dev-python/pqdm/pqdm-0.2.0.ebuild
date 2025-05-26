EAPI=8

PYTHON_COMPAT=( python3_{9..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Parallel TQDM"
HOMEPAGE="https://github.com/niedakh/pqdm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/bounded-pool-executor[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
