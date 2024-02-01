# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

REPO=myint

DESCRIPTION="untokenize transforms tokens into source code."
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

LICENSE="MIT"
SLOT="0"

RDEPEND=""
BDEPEND="${RDEPEND}"

#TODO enable test
#distutils_enable_tests pytest
