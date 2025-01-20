EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/GkAntonius/feynman"
else
	inherit pypi
	KEYWORDS="~amd64"
fi

DESCRIPTION="Feynman diagrams in matplotlib."
HOMEPAGE="
	https://github.com/GkAntonius/feynman
	https://pypi.org/project/feynman/
"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"

# TODO enable once they pass
#distutils_enable_tests pytest
