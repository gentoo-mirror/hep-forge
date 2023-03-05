# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

MY_PN="PHOTOS"
MY_P=${MY_PN}.${PV}

DESCRIPTION="PHOTOS"
HOMEPAGE="
    https://gitlab.cern.ch/photospp/photospp
	http://photospp.web.cern.ch/photospp/
"
SRC_URI="http://photospp.web.cern.ch/photospp/resources/${MY_P}/${MY_P}.tar.gz"
S=${WORKDIR}/${MY_PN}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples hepmc pythia tauola"

RDEPEND="
	hepmc? ( sci-physics/hepmc:2=[-cm(-),gev(+)] )
	sci-physics/hepmc:3=[-cm(-),gev(+)]
	pythia? ( sci-physics/pythia:8= )
    tauola? ( sci-physics/tauola[hepmc?,hepmc3,pythia?] )
"
DEPEND="${RDEPEND}
	doc? (
		app-doc/doxygen[dot]
		app-text/ghostscript-gpl
		app-text/texlive
	)
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--without-mc-tester \
		--with-hepmc3="${EPREFIX}/usr" \
		$(use_with hepmc hepmc "${EPREFIX}/usr") \
		$(use_with pythia pythia8 "${EPREFIX}/usr") \
		$(use_with tauola tauola "${EPREFIX}/usr") 
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
	fi
}