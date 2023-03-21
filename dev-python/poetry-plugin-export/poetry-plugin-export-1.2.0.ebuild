# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="A plugin that allows the export of locked packages to various formats"
HOMEPAGE="https://python-poetry.org/"
UNDER_PN="poetry_plugin_export"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${UNDER_PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	>=dev-python/poetry-core-1.3.2[${PYTHON_USEDEP}]
"

DEPEND="
	test? (
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-randomly[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

MY_P="${PN}-${NOPATCH_V}${PATCH_V}"

S="${WORKDIR}/${UNDER_PN}-${PV}"

distutils_enable_tests pytest
