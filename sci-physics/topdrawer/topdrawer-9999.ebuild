# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7

inherit git-r3


DESCRIPTION="TOPDRAWER"
HOMEPAGE="https://gitlab.com/APN-Pucky/topdrawer3"
EGIT_REPO_URI="https://gitlab.com/APN-Pucky/topdrawer3.git"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc examples"
DEPEND="virtual/fortran"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	make # single thread force needed
}

src_install() {
	dobin td
}

