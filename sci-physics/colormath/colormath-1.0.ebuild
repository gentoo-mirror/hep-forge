# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=ColorMath

DESCRIPTION="ColorMath is a Mathematica package for performing color sums in SU(Nc)"
HOMEPAGE="http://home.thep.lu.se/~malin/ColorMath.html"
SRC_URI="http://home.thep.lu.se/~malin/ColorMath/ColorMath${PV}.m"
S=${WORKDIR}

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sci-mathematics/mathematica"
RDEPEND="${DEPEND}"

src_install() {
	MMADIR=/usr/share/Mathematica/Applications
	insinto "${MMADIR}/${MY_PN}"
	doins "${DISTDIR}/ColorMath${PV}.m"
}
