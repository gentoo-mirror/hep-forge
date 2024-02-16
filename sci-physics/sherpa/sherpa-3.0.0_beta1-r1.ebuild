# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake fortran-2

MY_PN="SHERPA-MC"
MY_PV=${PV//_/}
MY_P=${MY_PN}-${MY_PV}


DESCRIPTION="Simulation of High-Energy Reactions of PArticles"
HOMEPAGE="https://gitlab.com/sherpa-team/sherpa"
SRC_URI="https://gitlab.com/sherpa-team/${PN}/-/archive/v${MY_PV}/${PN}-v${MY_PV}.tar.bz2"
#         https://gitlab.com/sherpa-team/sherpa/-/archive/v3.0.0beta1/sherpa-v3.0.0beta1.tar.bz2
#SRC_URI="https://www.hepforge.org/archive/sherpa/${MY_P}.tar.gz"
S="${WORKDIR}/${PN}-v${MY_PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+fastjet +pythia6 pythia8 rivet ufo gosam hepmc2 root gzip mpi openloops recola lhole analysis blackhat" # hztool madloop pgs mcfm

DEPEND="
	sci-physics/lhapdf
	dev-db/sqlite:3=
	sci-physics/hepmc:3=
	dev-libs/libzip
	blackhat? ( sci-physics/blackhat )
	rivet? ( sci-physics/rivet )
	gosam? ( sci-physics/gosam )
	gzip? ( app-arch/gzip )
	gosam? ( sci-physics/gosam )
	openloops? ( sci-physics/openloops )
	pythia8? ( sci-physics/pythia:8= )
	hepmc2?  ( sci-physics/hepmc:2= )
	fastjet? ( sci-physics/fastjet )
	root? ( sci-physics/root )
	mpi? ( virtual/mpi )
	recola? ( sci-physics/recola )
"
RDEPEND="${DEPEND}"

#src_prepare() {
#    default
#    eautoreconf
#}

src_configure() {
	#SHERPA_ENABLE_BINRELOC:BOOL=OFF
	#SHERPA_ENABLE_BLACKHAT:BOOL=OFF
	#SHERPA_ENABLE_CLANG_TIDY:BOOL=OFF
	#SHERPA_ENABLE_DIHIGGS:BOOL=OFF
	#SHERPA_ENABLE_EWSUD:BOOL=OFF
	#SHERPA_ENABLE_EXAMPLES:BOOL=ON

	#SHERPA_ENABLE_HEPMC3_ROOT:BOOL=OFF
	#SHERPA_ENABLE_HZTOOL:BOOL=OFF
	#
	#SHERPA_ENABLE_MADLOOP:BOOL=OFF
	#
	#SHERPA_ENABLE_MANUAL:BOOL=OFF
	#SHERPA_ENABLE_MCFM:BOOL=OFF
	#
	#
	#SHERPA_ENABLE_PYTHON:BOOL=OFF
	#SHERPA_ENABLE_TESTING:BOOL=OFF
	#SHERPA_ENABLE_THREADING:BOOL=OFF
	#SHERPA_ENABLE_VERSIONING:BOOL=OFF

	local mycmakeargs=(
		-DSHERPA_ENABLE_THREADING=ON
		-DSHERPA_ENABLE_ANALYSIS=$(usex analysis ON OFF)
		-DSHERPA_ENABLE_BLACKHAT=$(usex blackhat ON OFF)
		-DSHERPA_ENABLE_GOSAM=$(usex gosam ON OFF)
		-DSHERPA_ENABLE_GZIP=$(usex gzip ON OFF)
		-DSHERPA_ENABLE_HEPMC2=$(usex hepmc2 ON OFF)
		-DSHERPA_ENABLE_HEPMC3=ON
		-DSHERPA_ENABLE_LHAPDF=ON
		-DSHERPA_ENABLE_LHOLE=$(usex lhole ON OFF)
		-DSHERPA_ENABLE_MPI=$(usex mpi ON OFF)
		$(usex mpi -DCMAKE_C_COMPILER=mpicc) $(usex mpi -DCMAKE_CXX_COMPILER=mpic++) $(usex mpi -DCMAKE_Fortran_COMPILER=mpif90)
		-DSHERPA_ENABLE_OPENLOOPS=$(usex openloops ON OFF)
		-DOPENLOOPS_PREFIX=$(usex openloops "${ESYSROOT}/opt/OpenLoops2")
		-DSHERPA_ENABLE_PYTHIA6=$(usex pythia6 ON OFF)
		-DSHERPA_ENABLE_PYTHIA8=$(usex pythia8 ON OFF)
		-DSHERPA_ENABLE_RECOLA=$(usex recola ON OFF)
		-DSHERPA_ENABLE_RIVET=$(usex rivet ON OFF)
		-DSHERPA_ENABLE_ROOT=$(usex root ON OFF)
		-DSHERPA_ENABLE_UFO=$(usex ufo ON OFF)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}

