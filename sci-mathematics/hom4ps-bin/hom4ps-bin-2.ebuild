# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

DESCRIPTION="HOMotopy method for solving Polynomial Systems"
HOMEPAGE="http://www.math.nsysu.edu.tw/~leetsung/works/HOM4PS_soft_files/HOM4PS_Linux.htm"
SRC_URI="http://www.math.nsysu.edu.tw/~leetsung/works/HOM4PS_soft_files/HOM4PS${PV}_64-bit.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/HOM4PS2"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"

PATCHES=(
	"${FILESDIR}"/${PN}-2-path.patch
)

src_compile() {
	# pass
	echo "pass"
}

src_install() {
	dobin hom4ps2
	dobin bin/flwcrv
	dobin bin/sym2num
	#dobin bin/polyread
	#dobin bin/geneval
}
