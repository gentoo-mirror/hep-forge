# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Computing 1-loop amplitudes at the integrand level"
HOMEPAGE="https://www.ugr.es/~pittau/CutTools/"
SRC_URI="http://www.ugr.es/~pittau/CutTools/${PN}_v${PV}.tar.gz"

LICENSE="GPL-3"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/fortran
"
