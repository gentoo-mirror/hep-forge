# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1 optfeature

DESCRIPTION="Python interface for gluing together several HEP programs"
HOMEPAGE="
	https://github.com/APN-Pucky/HEPi
	https://pypi.org/project/hepi/
"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/APN-Pucky/HEPi"
else
	inherit pypi
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	sci-physics/lhapdf[python(+),${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/uncertainties[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.7.0[${PYTHON_USEDEP}]
		dev-python/sympy[${PYTHON_USEDEP}]
		dev-python/pqdm[${PYTHON_USEDEP}]
		>=dev-python/smpl-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.0.0[${PYTHON_USEDEP}]
		sci-physics/particle[${PYTHON_USEDEP}]
		sci-physics/pyslha[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	test? (
		sci-physics/resummino
		<sci-physics/spheno-4
		sci-physics/nll-fast
		sci-physics/nnll-fast:1
		sci-physics/softsusy
	)
"

src_prepare() {
	default
	sed -i 's/,"--cov=hepi","--cov-config=.coveragerc","--cov-append","--cov-report=term","--cov-report=xml"//' pyproject.toml || die
}

pkg_postinst() {
	optfeature "resummino support" sci-physics/resummino
	optfeature "madgraph support" sci-physics/madgraph
	optfeature "spheno support" <sci-physics/spheno-4
	optfeature "softsusy support" sci-physics/softsusy
	optfeature "nll-fast support" sci-physics/nll-fast
	optfeature "nnll-fast support" sci-physics/nnll-fast:1
	# TODO
	#optfeature "prospino2 support" sci-physics/prospino2
}

distutils_enable_tests pytest
