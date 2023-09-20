
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="A One-Loop Matrix Element Library for Higgs Boson Production via Electroweak Couplings"
HOMEPAGE="https://hjets.hepforge.org/"

SRC_URI="https://hjets.hepforge.org/downloads/?f=HJets-${PV}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"
