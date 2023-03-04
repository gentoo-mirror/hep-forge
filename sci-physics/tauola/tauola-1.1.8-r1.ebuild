# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="TAUOLA"
MY_P=${MY_PN}.${PV}

DESCRIPTION="Tau decay Monte Carlo generator"
HOMEPAGE="http://tauolapp.web.cern.ch/tauolapp/"
SRC_URI="http://tauolapp.web.cern.ch/tauolapp/resources/${MY_P}/${MY_P}-LHC.tar.gz"
S=${WORKDIR}/${MY_PN}

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples pythia hepmc hepmc3 tau-spinner"

RDEPEND="
	hepmc? ( sci-physics/hepmc:2=[-cm(-),gev(+)] )
	hepmc3? ( sci-physics/hepmc:3=[-cm(-),gev(+)] )
	pythia? ( sci-physics/pythia:8= )
	tau-spinner? ( sci-physics/lhapdf )
"
DEPEND="${RDEPEND}
	doc? (
		app-doc/doxygen[dot]
		app-text/ghostscript-gpl
		app-text/texlive
	)
"

#PATCHES=(
#	"${FILESDIR}"/${PN}-1.1.3-tau-spinner-makefile.patch
#)

src_configure() {
	econf \
		--without-mc-tester \
		$(use_with pythia pythia8 "${EPREFIX}/usr") \
		$(use_with hepmc hepmc "${EPREFIX}/usr") \
		$(use_with hepmc3 hepmc3 "${EPREFIX}/usr") \
		$(use_with tau-spinner) \
		$(use_with tau-spinner lhapdf "${EPREFIX}/usr")
}

src_compile() {
	emake -j1

	if use doc; then
		cd "${S}/documentation/doxy_documentation" || die
		default
		cd "${S}/documentation/latex_documentation" || die
		default
	fi
}

src_install() {
	emake DESTDIR="${ED}" install

	if use doc; then
		dodoc documentation/doxy_documentation/html/*
		dodoc documentation/latex_documentation/*.pdf
	fi

	if use examples; then
		dodoc -r examples
		use tau-spinner && docinto tau-spinner && dodoc -r TauSpinner/examples
	fi
}
