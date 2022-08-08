# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="TOPDRAWER renders top files."
HOMEPAGE="https://gitlab.com/APN-Pucky/topdrawer3"
EGIT_REPO_URI="https://gitlab.com/APN-Pucky/topdrawer3.git"

LICENSE="all-rights-reserved"
SLOT="0"

#
DEPEND="virtual/fortran"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	# single thread force needed
	export MAKEOPTS=-j1
	emake
}

src_install() {
	dobin td
}
