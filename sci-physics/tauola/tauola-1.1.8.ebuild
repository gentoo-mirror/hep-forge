# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

MY_PN="PHOTOS"
MY_P=${MY_PN}.${PV}

DESCRIPTION="PHOTOS"
HOMEPAGE="
    https://gitlab.cern.ch/photospp/photospp
    http://tauolapp.web.cern.ch/tauolapp/
"
SRC_URI="http://tauolapp.web.cern.ch/tauolapp/resources/${MY_P}/${MY_P}-LHC.tar.gz"
S=${WORKDIR}/${MY_PN}

LICENSE=""
SLOT=""
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	sci-physics/hepmc:2=[-cm(-),gev(+)]
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	eautoreconf
}