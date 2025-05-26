# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Simplified plotting in python."
HOMEPAGE="
	https://github.com/APN-Pucky/smplr
	https://pypi.org/project/smpl/
"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/APN-Pucky/smplr"
else
	inherit pypi
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
"

export EPYTEST_DESELECT=(
	# tight changes between versions
	'tests/test_all.py::test_bool[tight-None-True]'
	'tests/test_all.py::test_bool[tight-True-None]'
	'tests/test_all.py::test_bool[tight-True-True]'
	'tests/test_all.py::test_bool[tight-False-True]'
	'tests/test_all.py::test_bool[tight-True-False]'
)
distutils_enable_tests pytest
