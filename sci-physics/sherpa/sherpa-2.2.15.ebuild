# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools fortran-2

MY_PN="SHERPA-MC"
MY_P=${MY_PN}-${PV}


DESCRIPTION="Simulation of High-Energy Reactions of PArticles"
HOMEPAGE="https://gitlab.com/sherpa-team/sherpa"
#SRC_URI="https://gitlab.com/sherpa-team/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz"
SRC_URI="https://www.hepforge.org/archive/sherpa/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

IUSE="+fastjet +pythia hepmc2 root gzip mpi"

DEPEND="
	sci-physics/lhapdf
	dev-db/sqlite:3=
	sci-physics/hepmc:3=
	sci-physics/rivet
	pythia?  ( sci-physics/pythia )
	hepmc2?  ( sci-physics/hepmc:2= )
	fastjet? ( sci-physics/fastjet )
	root? ( sci-physics/root )
	gzip? ( app-arch/gzip )
	mpi? ( virtual/mpi )
"
RDEPEND="${DEPEND}"

#src_prepare() {
#    default
#    eautoreconf
#}

src_configure() {
	econf \
		--with-sqlite3="${ESYSROOT}"/usr \
		--enable-lhapdf="${ESYSROOT}"/usr \
		--enable-hepmc3="${ESYSROOT}"/usr \
		--enable-rivet="${ESYSROOT}"/usr \
		$(use_enable hepmc2 hepmc2 "${ESYSROOT}"/usr) \
		$(use_enable fastjet fastjet "${ESYSROOT}"/usr) \
		$(use_enable pythia pythia "${ESYSROOT}"/usr) \
		$(use_enable root root "${ESYSROOT}"/usr) \
		$(use_enable gzip gzip "${ESYSROOT}"/usr) \
		$(use_enable mpi mpi "${ESYSROOT}"/usr) \
#enable_analysis
#enable_root
#enable_hepmc2
#enable_hepmc3root
#enable_hepmc3
#enable_rivet
#enable_fastjet
#enable_blackhat
#enable_openloops
#enable_recola
#enable_madloop
#enable_mcfm
#enable_lhole
#enable_lhapdf
#enable_hztool
#enable_cernlib
#enable_pgs
#enable_delphes
#enable_gzip
#enable_pythia
#enable_hepevtsize
#enable_binreloc
}
