# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Simplified plotting and fitting in python."
HOMEPAGE="
	https://github.com/APN-Pucky/smpl
	https://pypi.org/project/smpl/
"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/APN-Pucky/smpl"
else
	inherit pypi
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	dev-python/smplr[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/iminuit[${PYTHON_USEDEP}]
	dev-python/uncertainties[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.7.0[${PYTHON_USEDEP}]
	dev-python/sympy[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/deprecation[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0.0[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/ipywidgets[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/nbval[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	default
	sed -i 's/,"--cov=smpl" ,"--cov-append","--cov-report=term" ,"--cov-report=xml"//' pyproject.toml || die
}

distutils_enable_tests pytest

