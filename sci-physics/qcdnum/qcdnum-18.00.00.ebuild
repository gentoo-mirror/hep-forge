#http://www.nikhef.nl/~h24/qcdnum/QcdnumDownload.html


# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="Fast QCD Evolution and Convolution"
HOMEPAGE="https://www.nikhef.nl/~h24/qcdnum/QcdnumDownload.html"

SRC_URI="https://www.nikhef.nl/~h24/qcdnum-files/download/qcdnum180000.tar.gz -> ${P}.tar.gz" # weird hepforge download names
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

src_configure() {
    econf
}