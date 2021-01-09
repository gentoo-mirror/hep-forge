# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="padevchooser"
HOMEPAGE="padevchooser"
SRC_URI="http://0pointer.de/lennart/projects/padevchooser/padevchooser-${PV}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="pulseaudio"
RDEPEND="${DEPEND}"
BDEPEND=""

inherit autotools

src_prepare() {
   default
   eautoreconf
}
