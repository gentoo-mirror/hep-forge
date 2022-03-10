# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib

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
PATCHES=( 
"${FILESDIR}"/${P}-soname.patch  
#"${FILESDIR}"/${P}-libdir.patch 
)


src_configure() {
	./configure --prefix=/usr
}
src_compile() {
	emake
	emake fragile-shared
}

src_install() {
	#into /usr/include/fastjet/
	#dodir /usr/include/fastjet/contrib
	emake install PREFIX=${D}/usr
	emake fragile-shared-install PREFIX="${D}/usr/"
	mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die "mv failed"
	#into /usr/lib/
	#dolib.so libfastjetcontribfragile.so

}
