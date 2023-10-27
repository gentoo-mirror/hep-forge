
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="A small-x resummation code"
HOMEPAGE="https://www.roma1.infn.it/~bonvini/hell/"

SRC_URI="https://www.roma1.infn.it/~bonvini/hell/downloads/HELL.v${PV}.tgz -> ${P}.tgz"
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="root"

RDEPEND="
	sci-libs/gsl
	sci-libs/cuba
"
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"