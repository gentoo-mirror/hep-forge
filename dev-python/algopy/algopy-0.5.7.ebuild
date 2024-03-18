EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url "${PN}" "${PV}" ".zip")"

DESCRIPTION="AlgoPy is a Research Prototype for Algorithmic Differentation in Python"
HOMEPAGE="
	https://github.com/b45ch1/algopy
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"
