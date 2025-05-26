EAPI=8

PYTHON_COMPAT=( python3_{9..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Bounded Process and Thread Pool Executor"
HOMEPAGE="https://github.com/mowshon/bounded_pool_executor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
