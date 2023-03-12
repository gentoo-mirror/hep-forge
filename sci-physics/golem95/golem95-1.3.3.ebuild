# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="performs the reduction to a certain set of basis integrals numerically"
HOMEPAGE="https://golem.hepforge.org/"
SRC_URI="https://golem.hepforge.org/downloads?f=golem95-1.3.3.tar.gz"
S="${WORKDIR}"

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