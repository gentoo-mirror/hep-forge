
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

MY_P=fastnlo_toolkit-2.5.0-2826
DESCRIPTION="fast pQCD calculations for hadron-induced processes"
HOMEPAGE="https://fastnlpo.hepforge.org/"

SRC_URI="https://fastnlo.hepforge.org/code/v25/${MY_P}.tar.gz -> ${P}.tar.gz" # weird hepforge download names
S="${WORKDIR}/${MY_P}"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
    sci-physics/lhapdf
"
DEPEND="${RDEPEND}"
BDEPEND="
    virtual/fortran
"
