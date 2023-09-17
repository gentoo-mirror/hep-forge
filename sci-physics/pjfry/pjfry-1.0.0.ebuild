https://github.com/Vayu/PJFry/archive/refs/tags/v1.0.0-beta.10.tar.gz


# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit autotools

DESCRIPTION="Fast predictions for Drell-Yan processes including qt-resummation"
HOMEPAGE="https://dyturbo.hepforge.org/"

SRC_URI="https://github.com/Vayu/PJFry/archive/refs/tags/v1.0.0-beta.10.tar.gz -> ${P}.tar.gz"
#S="${WORKDIR}/${P}"
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