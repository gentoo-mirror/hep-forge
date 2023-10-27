# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="The WHIZARD Event Generator "
HOMEPAGE="https://whizard.hepforge.org/"

SRC_URI="https://whizard.hepforge.org/downloads?f=${P}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="
    +lhapdf 
    +looptools 
    +hepmc
    hdf5
    openloops 
    recola2 
    qgraf 
    form
    pythia8 
    hoppet 
    fastjet 
    gosam 
    samurai
    ninja
" # TODO lcio python

RDEPEND="
	lhapdf? ( sci-physics/lhapdf )
	looptools? ( sci-physics/looptools )
	hepmc? ( sci-physics/hepmc )

	hdf5? ( sci-libs/hdf5 )
	recola2? ( sci-physics/recola2 )
	openloops? ( sci-physics/openloops )


	qgraf? ( sci-physics/qgraf )
	form? ( sci-mathematics/form )
	pythia8? ( sci-physics/pythia:8 )
	hoppet? ( sci-physics/hoppet )
	fastjet? ( sci-physics/fastjet )
	gosam? ( sci-physics/gosam )
	samurai? ( sci-physics/samurai )
	ninja? ( sci-physics/ninja )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	econf \
        $(use_enable lhapdf) \
        $(use_enable looptools) \
        $(use_enable hepmc) \
        $(use_enable pythia8) \
        $(use_enable hoppet) \
        $(use_enable fastjet) \
        $(use_enable openloops) \
        $(use_enable gosam) \
        $(use_enable hdf5) \
        $(use_with form) \
        $(use_with qgraf) \
        $(use_with ninja) \
        $(use_with samurai) \
#TODO        $(use_enable python) \ 

}
