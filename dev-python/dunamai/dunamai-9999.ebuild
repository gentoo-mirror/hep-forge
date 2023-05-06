# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

REPO=mtkennerly

DESCRIPTION="Library and command line tool for producing version strings"
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

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-python/packaging-20.9[${PYTHON_USEDEP}]
	>=dev-python/importlib_metadata-1.6.0[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

#TODO enable test
#distutils_enable_tests pytest
