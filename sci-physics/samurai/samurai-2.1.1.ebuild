# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Scattering AMplitudes from Unitarity-based Reduction Algorithm at the Integrand level."
HOMEPAGE="https://samurai.hepforge.org/"
SRC_URI="http://www.hepforge.org/archive/samurai/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3+"
KEYWORDS="~amd64"
IUSE="+qcdloop looptools"

RDEPEND="
	sci-physics/oneloop[dpkind,qpkind16,-qpkind]
	qcdloop? ( sci-physics/qcdloop )
	looptools? ( sci-physics/looptools )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	default
	# Fix that qcdloop and oneloop are already installed
	sed -i 's/lib_LTLIBRARIES.*/lib_LTLIBRARIES = libsamurai.la/g' Makefile.am || die
	econf --with-avh_olo="${ESYSROOT}"/usr/$(get_libdir)/libavh_olo.so --with-avh_olo_precision=double --with-precision=double $(use_with qcdloop qcdloop "${ESYSROOT}"/usr) $(use_with looptools looptools "${ESYSROOT}"/usr) FCFLAGS="${FCFLAGS} -std=legacy -fPIC -I${ESYSROOT}/usr/include"
	# fix old vs new oneloop parameters
	sed -i 's/avh_olo_kinds/avh_olo_dp_kinds/g' samurai/madds.f90 || die
}

src_compile() {
	emake -j1
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
