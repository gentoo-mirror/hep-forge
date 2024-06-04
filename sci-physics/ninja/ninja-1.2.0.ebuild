# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools fortran-2

DESCRIPTION="Integrand Reduction via Laurent Expansion method for the computation of one-loop integrals."
HOMEPAGE="
	https://github.com/peraro/ninja
	https://ninja.hepforge.org/
"
SRC_URI="
	https://github.com/peraro/ninja/releases/download/v${PV}/${PN}-latest.tar.gz -> ${P}.tar.gz.gh
"

SLOT="0"
LICENSE="GPL-3+"
KEYWORDS="~amd64"
IUSE="static-libs quad gosam"

RDEPEND="
	sci-physics/oneloop
	sci-physics/looptools
	gosam? ( sci-physics/gosam )
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# Replace #!/bin/sh with #!/bin/bash
	sed -i -e 's:#!/bin/sh:#!/bin/bash:' configure || die	
	econf \
		$(use_enable static-libs static) \
		$(use_enable quad quadninja) \
		$(use_enable gosam)
}

src_compile() {
	# single thread force needed since fortan mods depend on each other
	export MAKEOPTS="$MAKEOPTS -j1"
	default
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
