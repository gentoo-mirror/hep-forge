# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

REPO=PyCQA

DESCRIPTION="Formats docstrings to follow PEP 257."
HOMEPAGE="
	https://github.com/${REPO}/${PN}
	https://pypi.org/project/${PN}/
"
if [[ ${PV} == 9999 ]]; then 		
	inherit git-r3 		
	EGIT_REPO_URI="https://github.com/${REPO}/${PN}" 
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

IUSE=""

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-python/charset_normalizer-2.0.0
	>=dev-python/tomli-2.0.0
	>=dev-python/untokenize-0.1.1
"
BDEPEND="${RDEPEND}"

#TODO enable test
#distutils_enable_tests pytest
