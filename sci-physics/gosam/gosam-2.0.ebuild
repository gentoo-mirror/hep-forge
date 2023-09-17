
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit autotools fortran-2 python-single-r1

DESCRIPTION="Fast predictions for Drell-Yan processes including qt-resummation"
HOMEPAGE="https://dyturbo.hepforge.org/"

SRC_URI="https://gosam.hepforge.org/gosam-2.0-latest.tar.gz" -> ${P}.tar.gz" # weird hepforge download names
#S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
    >=sci-mathematics/form-4.0.0
    sci-physics/qgraf
    sci-physics/ninja
    sci-physics/samurai
    sci-physics/golem95
    sci-physics/qcdloop
    sci-physics/oneloop
    sci-physics/ff
"
DEPEND="${RDEPEND}"
BDEPEND=""