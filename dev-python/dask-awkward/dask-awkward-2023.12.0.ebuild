EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Native Dask collection for awkward arrays, and the library to use it."
HOMEPAGE="https://github.com/dask-contrib/dask-awkward/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/awkward-2.4.5[${PYTHON_USEDEP}]
	>=dev-python/dask-2023.04.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"