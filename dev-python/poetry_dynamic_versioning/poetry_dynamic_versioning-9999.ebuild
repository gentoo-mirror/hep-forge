# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

MY_PN=poetry_dynamic_versioning
MY_P=${MY_PN}-${PV}
REPO=mtkennerly

DESCRIPTION="Plugin for Poetry to enable dynamic versioning based on VCS tags"
HOMEPAGE="
	https://github.com/${REPO}/${PN}
	https://pypi.org/project/${PN}/
"

if [[ ${PV} == 9999 ]]; then 	
	inherit git-r3 	
	EGIT_REPO_URI="https://github.com/${REPO}/${PN}" 
else
	inherit pypi
	# https://github.com/mtkennerly/${PN}/releases/download/v${PV}/${P}.tar.gz
	#S="${WORKDIR}/${MY_P}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-python/dunamai-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.4[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/poetry-core-1.2.0[${PYTHON_USEDEP}]
"
BDEPEND="${BDEPEND}"

#TODO enable test
#distutils_enable_tests pytest
