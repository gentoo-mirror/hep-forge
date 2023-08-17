#http://www.nikhef.nl/~h24/qcdnum/QcdnumDownload.html


# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="Fast QCD Evolution and Convolution"
HOMEPAGE="https://www.nikhef.nl/~h24/qcdnum/QcdnumDownload.html"

SRC_URI="https://www.nikhef.nl/~h24/qcdnum-files/download/qcdnum${PV//.}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/qcdnum-18-00-00"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_prepare() {
	default
	sed -i "$ a AM_FFLAGS = -Iinc" **/Makefile.am || die
	eautoreconf
}

src_configure() {
	econf
}