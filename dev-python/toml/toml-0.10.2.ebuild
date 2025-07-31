EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python lib for TOML"
HOMEPAGE="https://github.com/uiri/toml"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
