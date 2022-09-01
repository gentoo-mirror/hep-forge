# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# TODO needs python module

MY_PN=Professor
MY_P=${MY_PN}-${PV}

DESCRIPTION="A tuning tool for Monte Carlo event generators"
HOMEPAGE="https://professor.hepforge.org/"
SRC_URI="https://professor.hepforge.org/downloads/?f=${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sci-physics/yoda
	dev-python/numpy
	dev-python/matplotlib
	dev-python/iminuit
	dev-cpp/eigen:3
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/cython
"

src_compile() {
	emake CPPFLAGS="${CPPFLAGS} -I${SYSROOT}/usr/include/eigen3"
}
