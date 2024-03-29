# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="TOPDRAWER renders top files."
HOMEPAGE="https://gitlab.com/APN-Pucky/topdrawer3"
SRC_URI="https://gitlab.com/APN-Pucky/topdrawer3/-/archive/${PV}/${P}.tar.bz2"
S="${WORKDIR}/${PN}3-${PV}"

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="virtual/fortran"

src_compile() {
	# single thread force needed
	export MAKEOPTS="$MAKEOPTS -j1"
	emake FFLAGS="$FFLAGS" FCLDFLAGS="$LDFLAGS"
}

src_install() {
	dobin td
}
