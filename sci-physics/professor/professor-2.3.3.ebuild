# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..11} )
inherit python-single-r1
# TODO needs python module

MY_PN=Professor
MY_P=${MY_PN}-${PV}

DESCRIPTION="A tuning tool for Monte Carlo event generators"
HOMEPAGE="
	https://professor.hepforge.org/
	https://gitlab.com/hepcedar/professor
"
SRC_URI="https://professor.hepforge.org/downloads/?f=${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	sci-physics/yoda[python(-),${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
	    dev-python/numpy[${PYTHON_USEDEP}]
	    dev-python/matplotlib[${PYTHON_USEDEP}]
	    dev-python/sympy[${PYTHON_USEDEP}]
	    dev-python/iminuit[${PYTHON_USEDEP}]
	')
	dev-cpp/eigen:3
"
RDEPEND="
	${PYTHON_DEPS}
	${DEPEND}
"
BDEPEND="
	$(python_gen_cond_dep '
	    dev-python/cython[${PYTHON_USEDEP}]
    ')
"

src_compile() {
	emake CPPFLAGS="${CPPFLAGS} -I${SYSROOT}/usr/include/eigen3"
}
