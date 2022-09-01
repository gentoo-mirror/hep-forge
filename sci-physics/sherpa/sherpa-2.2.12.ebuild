# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

MY_PN="SHERPA-MC-"
MY_PF=${MY_PN}-${PV}


DESCRIPTION="Simulation of High-Energy Reactions of PArticles"
HOMEPAGE="https://gitlab.com/sherpa-team/sherpa"
SRC_URI="https://www.hepforge.org/archive/sherpa/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+sqlite +rivet +lhapdf +hepmc2 +pythia +fastjet"

DEPEND="
	sci-physics/lhapdf
	pythia?  ( sci-physics/pythia )
	rivet?   ( sci-physics/rivet )
	hepmc2?  ( sci-physics/hepmc:2= )
	fastjet? ( sci-physics/fastjet )
	sqlite?  ( dev-db/sqlite:3= )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	econf \
		$(use_enable hepmc2) \
		$(use_enable rivet) \
		$(use_enable fastjet) \
		$(use_enable pythia) \
		$(use_with sqlite sqlite3)
}
