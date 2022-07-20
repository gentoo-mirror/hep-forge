# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


MY_PN=fjcontrib
MY_P=${MY_PN}-${PV}

DESCRIPTION="3rd party extensions of FastJet."
HOMEPAGE="http://fastjet.hepforge.org/contrib/"
SRC_URI="http://fastjet.hepforge.org/contrib/downloads/${MY_P}.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=sci-physics/fastjet-3.4.0"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
"${FILESDIR}"/${PN}-soname.patch
)

src_prepare() {
	default
}

src_configure() {
	./configure --prefix=/usr --fastjet-config=/usr/bin/fastjet-config CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" FFLAGS="${FFLAGS}" LDFLAGS="${LDFLAGS}"
}
src_compile() {
	emake
	emake fragile-shared
}

src_install() {
	emake install PREFIX="${D}/usr"
	dolib.so libfastjetcontribfragile.so
	# The name used for requesting this library varies
	dosym libfastjetcontribfragile.so /usr/$(get_libdir)/libfastjetcontribfragile.so.0
	dosym libfastjetcontribfragile.so /usr/$(get_libdir)/fastjetcontribfragile.so.0
}
