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

IUSE="+fastjet +pythia +rivet +ufo delphes hepmc2 root gzip mpi openloops recola lhole cernlib analysis" # hztool madloop blackhat pgs mcfm

DEPEND="
	sci-physics/lhapdf
	dev-db/sqlite:3=
	sci-physics/hepmc:3=
	rivet? ( sci-physics/rivet )
	hepmc2?  ( sci-physics/hepmc:2= )
	fastjet? ( sci-physics/fastjet )
	root? ( sci-physics/root )
	gzip? ( app-arch/gzip )
	mpi? ( virtual/mpi )
	delphes? ( sci-physics/delphes )
	recola? ( sci-physics/recola )
	openloops? ( sci-physics/openloops )
	cernlib? ( sci-physics/cernlib )
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
		$(use_enable rivet rivet "${ESYSROOT}"/usr) \
		$(usex mpi FC=mpifort) $(usex mpi CC=mpicc) $(usex mpi CXX=mpic++) \
		$(use_enable hepmc2 hepmc2 "${ESYSROOT}"/usr) \
		$(use_enable fastjet fastjet "${ESYSROOT}"/usr) \
		$(use_enable analysis) \
		$(use_enable pythia) \
		$(use_enable lhole) \
		$(use_enable ufo) \
		$(use_enable cernlib cernlib "${ESYSROOT}"/usr) \
		$(use_enable recola recola "${ESYSROOT}"/usr) \
		$(use_enable openloops openloops "${ESYSROOT}"/usr) \
		$(use_enable delphes delphes "${ESYSROOT}"/usr) \
		$(use_enable root root "${ESYSROOT}"/usr) \
		$(use_enable gzip gzip "${ESYSROOT}"/usr) \
		$(use_enable mpi mpi "${ESYSROOT}"/usr) \
#enable_blackhat
#enable_madloop
#enable_hztool
#enable_pgs
#enable_hepevtsize
#enable_binreloc
}
