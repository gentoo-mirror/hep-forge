# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="The WHIZARD Event Generator"
HOMEPAGE="
	https://whizard.hepforge.org/
	https://gitlab.tp.nt.uni-siegen.de/whizard/public
"

inherit optfeature

SRC_URI="https://whizard.hepforge.org/downloads?f=${P}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
IUSE="+omega +lhapdf +looptools +hepmc lcio openloops recola2 qgraf form pythia8 hoppet fastjet gosam samurai ninja mpi +openmp" # TODO python
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	dev-ml/ocamlbuild
	lhapdf? (
		sci-physics/lhapdf
		sci-physics/lhapdf-sets[lhapdf_sets_ct10,lhapdf_sets_cteq6l1]
	)
	looptools? ( sci-physics/looptools )
	hepmc? ( || ( sci-physics/hepmc:2 sci-physics/hepmc:3 ) )

	recola2? ( sci-physics/recola2 )
	openloops? ( sci-physics/openloops )

	lcio? ( sci-physics/lcio )

	qgraf? ( sci-physics/qgraf )
	form? ( sci-mathematics/form )
	pythia8? ( sci-physics/pythia:8 )
	hoppet? ( sci-physics/hoppet )
	fastjet? ( sci-physics/fastjet )
	gosam? ( sci-physics/gosam )
	samurai? ( sci-physics/samurai )
	ninja? ( sci-physics/ninja )
	mpi? ( sys-cluster/openmpi )
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	econf \
		--disable-default-UFO-dir \
		$(use_enable mpi fc-mpi) \
		$(use_enable openmp) \
		$(use_enable openmp fc-openmp) \
		$(use_enable omega) \
		$(use_enable lhapdf) \
		$(use_enable looptools) \
		$(use_enable hepmc) \
		$(use_enable pythia8) \
		$(use_enable hoppet) \
		$(use_enable fastjet) \
		$(use_enable openloops) \
		$(use_enable gosam) \
		$(use_enable lcio) \
		$(use_enable recola) \
		$(use_with form) \
		$(use_with qgraf) \
		$(use_with ninja) \
		$(use_with samurai) \
#TODO        $(use_enable python) \

}

src_compile() {
	emake $(usex mpi FC=mpifort) $(usex mpi CC=mpicc) $(usex mpi CXX=mpic++)
}

pkg_postinst() {
	optfeature "visualisation latex" dev-texlive/texlive-metapost
}
