
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="Fast predictions for Drell-Yan processes including qt-resummation "
HOMEPAGE="https://dyturbo.hepforge.org/"

SRC_URI="https://dyturbo.hepforge.org/downloads?f=${P}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="root"

RDEPEND="
	root? ( sci-physics/root )
"
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"

src_configure() {
	econf  $(use_enable root)
}