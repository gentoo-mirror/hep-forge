# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

MY_PN=poetry_dynamic_versioning
MY_P=${MY_PN}-${PV}

DESCRIPTION="Plugin for Poetry to enable dynamic versioning based on VCS tags"
HOMEPAGE="
	https://github.com/mtkennerly/${PN}
	https://pypi.org/project/${PN}/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"
# https://github.com/mtkennerly/${PN}/releases/download/v${PV}/${P}.tar.gz
S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dunamai-1.14.0
	>=dev-python/tomlkit-0.4
	>=dev-python/jinja-2.11.1
	>=dev-python/poetry-core-1.2.0
"
BDEPEND="${BDEPEND}"

distutils_enable_tests pytest
