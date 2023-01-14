# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

REPO=APN-Pucky

DESCRIPTION="Simplified plotting and fitting in python."
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
	dev-python/numpy
	dev-python/matplotlib
	>=dev-python/scipy-1.7.0
    dev-python/sympy
    dev-python/tqdm
    >=dev-python/pandas-1.0.0
    dev-python/uncertainties
"
BDEPEND="${RDEPEND}"
src_prepare() {
    default
	# Don't use dynamic versioning 	
	sed -i "s/version.*=.*\"0\.0\.0\"/version = \"${PV}\"/" pyproject.toml 	
	sed -i "s/requires.*=.*/requires = [\"poetry-core>=1.0.0\"]/" pyproject.toml 	
	sed -i 's/poetry_dynamic_versioning.backend/poetry.core.masonry.api/g' pyproject.toml
}

# TODO needs test deps
#distutils_enable_tests pytest

