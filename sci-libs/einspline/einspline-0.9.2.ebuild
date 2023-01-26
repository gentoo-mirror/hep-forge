# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C library for creating and evaluating B-splines"
HOMEPAGE="http://einspline.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="altivec cuda blips double fortran sse"

DEPEND="cuda? ( dev-util/nvidia-cuda-toolkit )
		blips? ( sci-libs/fftw )
		fortran? ( virtual/fortran )
"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable cuda) \
		$(use_enable blips) \
		$(use_enable altivec) \
		$(use_enable sse) \
		$(use_enable fortran) \
	$(use_enable double precision) \
		|| die "Configure failed"
}