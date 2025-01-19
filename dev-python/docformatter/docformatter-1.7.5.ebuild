# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

REPO=PyCQA

DESCRIPTION="Formats docstrings to follow PEP 257."
HOMEPAGE="
	https://github.com/PyCQA/docformatter
	https://pypi.org/project/docformatter/
"
if [[ ${PV} == 9999 ]]; then 		
	inherit git-r3 		
	EGIT_REPO_URI="https://github.com/${REPO}/${PN}" 
else
	inherit pypi
	KEYWORDS="~amd64"
fi

IUSE=""

LICENSE="MIT"
SLOT="0"

PATCHES=(
	"${FILESDIR}/${P}"-license.patch
)

RDEPEND="
	>=dev-python/charset-normalizer-3.0.0
	>=dev-python/tomli-2.0.0
	>=dev-python/untokenize-0.1.1
"

#TODO enable test
#distutils_enable_tests pytest
