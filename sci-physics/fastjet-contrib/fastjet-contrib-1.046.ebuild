# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=fjcontrib

DESCRIPTION="3rd party extensions of FastJet."
HOMEPAGE="http://fastjet.hepforge.org/contrib/"
SRC_URI="http://fastjet.hepforge.org/contrib/downloads/${MY_PN}-${PV}.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=sci-physics/fastjet-3.4.0"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
"${FILESDIR}"/${P}-soname.patch
#"${FILESDIR}"/${P}-libdir.patch
)

src_prepare() {
	default
}

src_configure() {
	./configure --prefix=/usr --fastjet-config=/usr/bin/fastjet-config
}
src_compile() {
	emake
	emake fragile-shared
}

src_install() {
	#into /usr/include/fastjet/
	#dodir /usr/include/fastjet/contrib
	#emake fragile-shared-install PREFIX="${D}/usr"
	emake install PREFIX="${D}/usr"
	dolib.so libfastjetcontribfragile.so
	dosym libfastjetcontribfragile.so /usr/$(get_libdir)/libfastjetcontribfragile.so.0
	dosym libfastjetcontribfragile.so /usr/$(get_libdir)/fastjetcontribfragile.so.0

	#mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die "mv failed"
	#into /usr/lib/

}
