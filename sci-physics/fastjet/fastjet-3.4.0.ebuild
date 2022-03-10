# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

FORTRAN_NEEDED=plugins

inherit autotools flag-o-matic fortran-2


DESCRIPTION="A software package for jet finding in pp and e+e- collisions"
HOMEPAGE="http://fastjet.fr/"
SRC_URI="http://fastjet.fr/repo/${P}.tar.gz"
#S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cgal doc examples +plugins pyext +contrib"
FEATURES='-sandbox -usersandbox'

DEPEND="
sys-devel/gcc[fortran]
dev-lang/python
contrib? ( sci-physics/fastjet-contrib )
cgal? ( sci-mathematics/cgal:=[shared(+)] )
plugins? ( sci-physics/siscone:= )
"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-doc/doxygen[dot] )"

PATCHES=( "${FILESDIR}"/${P}-system-siscone.patch )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	use cgal && has_version 'sci-mathematics/cgal[gmp]' && append-libs -lgmp
	econf $(use_enable cgal) $(use_enable plugins allplugins) $(use_enable plugins allcxxplugins) --enable-static=no --disable-static $(use_enable pyext)
}

src_compile() {
	default
	if use doc; then
		doxygen Doxyfile || die
		HTML_DOCS=( html/. )
	fi
}

src_install() {
	default
	if use examples; then
		emake -C example maintainer-clean
		find example -iname 'makefile*' -delete || die

		docinto examples
		dodoc -r example/.
		docompress -x /usr/share/doc/${PF}/examples
	fi
	find "${ED}" -name '*.la' -delete || die
}
