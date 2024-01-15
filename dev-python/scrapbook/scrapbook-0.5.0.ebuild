EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library for recording and reading data in notebooks."
HOMEPAGE="https://github.com/nteract/scrapbook/"

SRC_URI="https://github.com/nteract/scrapbook/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64" # because of pyarrow

RDEPEND="
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/papermill[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/pyarrow[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
