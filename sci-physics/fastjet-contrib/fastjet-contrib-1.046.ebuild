# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=fjcontrib

DESCRIPTION="3rd party extensions of FastJet."
HOMEPAGE="http://fastjet.hepforge.org/contrib/"
SRC_URI="http://fastjet.hepforge.org/contrib/downloads/${MY_PN}-${PV}.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=sci-physics/fastjet-3.4.0"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure --prefix=/usr
}
src_compile() {
	emake
	emake fragile-shared
}

src_install() {
	default
}
