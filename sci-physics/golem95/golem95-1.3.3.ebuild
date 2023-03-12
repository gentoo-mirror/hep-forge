# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="performs the reduction to a certain set of basis integrals numerically"
HOMEPAGE="https://golem.hepforge.org/"
SRC_URI="https://golem.hepforge.org/downloads?f=${P}.tar.gz"
S="${WORKDIR}"

LICENSE="GPL-3"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="+looptools"
RDEPEND="
	sci-physics/oneloop[dpkind,qpkind16,-qpkind,tlevel]
	looptools? ( sci-physics/looptools )
"
DEPEND="${REPEND}"
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
	sed -i 's/lib_LTLIBRARIES.*/lib_LTLIBRARIES = libgolem.la/g' Makefile.am || die
	econf --with-avh_olo="${ESYSROOT}"/usr/$(get_libdir)/libavh_olo.so --with-avh_olo_precision=double --with-precision=double $(use_with looptools looptools "${ESYSROOT}"/usr) FCFLAGS="${FCFLAGS} -std=legacy -fPIC -I${ESYSROOT}/usr/include"
	# fix old vs new oneloop parameters
	#sed -i 's/avh_olo_kinds/avh_olo_dp_kinds/g' samurai/madds.f90 || die
}

src_compile() {
	emake -j1
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}