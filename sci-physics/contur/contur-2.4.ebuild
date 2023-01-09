# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Exploring the sensitivity of unfolded collider measurements to BSM models."
HOMEPAGE="
    https://hepcedar.gitlab.io/contur-webpage/index.html
    https://gitlab.com/hepcedar/contur
"

REPO=hepcedar

if [[ ${PV} == 9999 ]]; then 	
	inherit git-r3 	
	EGIT_REPO_URI="https://github.com/${REPO}/${PN}" 
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
    # https://gitlab.com/${REPO}/${PN}/-/archive/${P}/${PN}-${P}.tar.gz
	S="${WORKDIR}/${MY_P}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy
    dev-python/scipy
    dev-python/pandas
    dev-python/configobj
    dev-python/matplotlib
    dev-python/tqdm
    dev-python/pytest
    dev-python/pyyaml
    dev-python/pyslha
    dev-python/click
    dev-python/scikit-learn
    dev-python/pathos
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	default
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
