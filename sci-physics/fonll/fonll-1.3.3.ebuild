# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_P=FONLL-${PV}
DESCRIPTION="FONLL Heavy Quark Production"
HOMEPAGE="
	http://cacciari.web.cern.ch/cacciari/fonll/
	http://www.lpthe.jussieu.fr/~cacciari/fonll/fonllform.html

	https://arxiv.org/hep-ph/980340
	https://arxiv.org/hep-ph/0102134
"
SRC_URI="http://cacciari.web.cern.ch/cacciari/fonll/FONLL-1.3.3.tgz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="
	sci-physics/lhapdf
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

PATCHES=(
	"${FILESDIR}"/fonll-1.3.3-legacy.patch
)

src_compile() {
	FFLAGS="${FFLAGS} -fPIC -std=legacy" emake -f main/Makefile VPATH=main:hdmassive:hdresummed:phmassive:phresummed:common fonll
}

src_install() {
	dobin fonll
}
