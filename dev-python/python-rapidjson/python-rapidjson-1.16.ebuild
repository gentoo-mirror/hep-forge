EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper around rapidjson "
HOMEPAGE="
	https://github.com/python-rapidjson/python-rapidjson
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pysimdjson-5.0.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.7.6[${PYTHON_USEDEP}]
	>=dev-python/simplejson-3.17.6[${PYTHON_USEDEP}]
	>=dev-python/ujson-5.4.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

# too much benchmarking
#distutils_enable_tests pytest
