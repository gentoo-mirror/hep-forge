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

LICENSE=""
SLOT=""
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	sci-physics/hepmc:3=[-cm(-),gev(+)]
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	eautoreconf
}