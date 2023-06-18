# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1 optfeature

REPO=APN-Pucky

DESCRIPTION="Python interface for gluing together several HEP programs"
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

RDEPEND="
    sci-physics/lhapdf[python(+)]
    dev-python/uncertainties
    dev-python/numpy
    dev-python/matplotlib
    >=dev-python/scipy-1.7.0
    dev-python/sympy
    dev-python/pqdm
    >=dev-python/smpl-0.0.152
    >=dev-python/pandas-1.0.0
    sci-physics/particle
    sci-physics/pyslha
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

pkg_postinst() {
        optfeature "resummino support" sci-physics/resummino
        optfeature "madgraph support" sci-physics/madgraph
        optfeature "spheno support" sci-physics/spheno
		# TODO
        #optfeature "nllfast support" sci-physics/nllfast
        #optfeature "prospino2 support" sci-physics/prospino2
}
