# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

REPO=tefra

DESCRIPTION="Library and command line tool for producing version strings"
HOMEPAGE="
	https://github.com/${REPO}/${PN}
	https://pypi.org/project/${PN}/
"
if [[ ${PV} == 9999 ]]; then 		
	inherit git-r3 		
	EGIT_REPO_URI="https://github.com/${REPO}/${PN}" 
else
	inherit pypi
	KEYWORDS="~amd64"
fi

IUSE="cli lxml soap"

LICENSE="MIT"
SLOT="0"

RDEPEND="
	lxml? ( >=dev-python/lxml-4.4.1 )
    cli? (
        >=dev-python/click-5
        >=dev-python/click-default-group-1.2
        >=dev-python/jinja-2.10
        >=dev-python/toposort-1.5
        dev-python/docformatter
    )
    soap? ( dev-python/requests )
"
BDEPEND="${RDEPEND}"

#TODO enable test
#distutils_enable_tests pytest
