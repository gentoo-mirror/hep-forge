# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools elisp-common java-pkg-opt-2

MY_P=ThePEG-${PV}

DESCRIPTION="Toolkit for High Energy Physics Event Generation"
HOMEPAGE="http://home.thep.lu.se/ThePEG/"

TEST_URI="https://www.hepforge.org/archive/lhapdf/pdfsets/current"
SRC_URI="https://www.hepforge.org/archive/thepeg/${MY_P}.tar.bz2
	test? ( 
		hepmc2? (
			${TEST_URI}/cteq6ll.LHpdf
			${TEST_URI}/cteq5l.LHgrid
			${TEST_URI}/GRV98nlo.LHgrid
			${TEST_URI}/MRST2001nlo.LHgrid ) 
		hepmc3? (
			${TEST_URI}/cteq6ll.LHpdf
			${TEST_URI}/cteq5l.LHgrid
			${TEST_URI}/GRV98nlo.LHgrid
			${TEST_URI}/MRST2001nlo.LHgrid )
	)"

LICENSE="GPL-2"
SLOT="0/30"
KEYWORDS="~amd64"
IUSE="emacs fastjet +hepmc3 hepmc2 lhapdf static-libs test zlib rivet"
RESTRICT="!test? ( test )"
REQUIRED_USE="?? ( hepmc3 hepmc2 )"

CDEPEND="
	sci-libs/gsl:0=
	emacs? ( >=app-editors/emacs-23.1:* )
	fastjet? ( sci-physics/fastjet:0= )
	rivet? ( sci-physics/rivet:3=[hepmc2=,hepmc3=] )
	hepmc3? ( sci-physics/hepmc:3= )
	hepmc2? ( sci-physics/hepmc:2= )
	lhapdf? ( >=sci-physics/lhapdf-6.0:0= )
	zlib? ( sys-libs/zlib:0= )"
DEPEND="${CDEPEND}
	sci-libs/gsl
	java? ( virtual/jdk:1.8 )
	test? (
		sys-process/time
		dev-libs/boost
	)"
RDEPEND="${CDEPEND}
	java? ( virtual/jre:1.8 )"

S="${WORKDIR}/${MY_P}"

PATCHES=(
	"${FILESDIR}"/${PN}-1.8.3-java.patch
	"${FILESDIR}"/${PN}-2.0.4-gcc6.patch
)

src_prepare() {
	find -name 'Makefile.am' -exec \
		sed -i -e '1ipkgdatadir=$(datadir)/ThePEG' {} \; || die
	# trick to force c++ linking
	sed -i \
		-e '1inodist_EXTRA_libThePEG_la_SOURCES = dummy.cxx' \
		-e '/dist_pkgdata_DATA = ThePEG.el/d' \
		lib/Makefile.am || die
	default
	java-pkg-opt-2_src_prepare
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_with fastjet fastjet "${EROOT}"/usr) \
		$(use_with hepmc2 hepmc "${EROOT}"/usr) \
		$(use_with hepmc3 hepmc "${EROOT}"/usr) \
		$(use_with hepmc2 hepmcversion 2) \
		$(use_with hepmc3 hepmcversion 3) \
		$(use_with java javagui) \
		$(use_with lhapdf lhapdf "${EROOT}"/usr) \
		$(use_with test boost "${EROOT}"/usr) \
		$(use_with rivet rivet "${EROOT}"/usr) \
		$(use_with zlib zlib "${EROOT}"/usr)
}

src_compile() {
	default
	use emacs && elisp-compile lib/ThePEG.el
}

src_test() {
	emake LHAPATH="${DISTDIR}" check
}

src_install() {
	default
	use emacs && elisp-install ${PN} lib/ThePEG.el{,c}
	use java && java-pkg_newjar java/ThePEG.jar

	cat <<-EOF > "${T}"/50${PN}
	LDPATH="${EPREFIX}/usr/$(get_libdir)/ThePEG"
	EOF
	doenvd "${T}"/50${PN}

	find "${ED}" -name '*.la' -delete || die
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
