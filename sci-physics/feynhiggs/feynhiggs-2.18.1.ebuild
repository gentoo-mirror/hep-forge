# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
FETCHCOMMAND="/usr/bin/wget --no-check-certificate \${URI} -P \${DISTFILES}"
RESUMECOMMAND="/usr/bin/wget -c --no-check-certificate \${URI} -P \${DISTFILES}"

inherit fortran-2
# flag-o-matic 

MY_PN="FeynHiggs"
MY_P=${MY_PN}-${PV}

DESCRIPTION="Calculation of the masses, mixings and much more of the Higgs bosons in the MSSM"
HOMEPAGE="https://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/cFeynHiggs.html"
SRC_URI="https://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/newversion/${MY_P}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	econf --prefix=${ESYSROOT}/usr
}

src_install() {
	emake install PREFIX="${ED}/usr"
	# collisions with looptools
	find "${ED}" -name 'fcc' -delete || die
	find "${ED}" -name 'f++' -delete || die
}
