# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9,10} )

inherit python-single-r1 scons-utils

MY_P=OpenLoops-${P}

DESCRIPTION="Evaluation of tree and one-loop matrix elements for any Standard Model."
HOMEPAGE="https://openloops.hepforge.org/index.html"
SRC_URI="https://openloops.hepforge.org/downloads?f=${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	escons CC="$(tc-getCC)"
}

src_install() {
	escons LIBDIR=/usr/$(get_libdir) INSTALL_ROOT="${ED}" install
}
