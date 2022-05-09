# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="FeynArts renders Feynman diagrams and generates their topologies."
HOMEPAGE="http://feynarts.de"
SRC_URI="http://feynarts.de/${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE=""

RDEPEND="
	sci-mathematics/mathematica
	"
DEPEND="${RDEPEND}"
BDEPEND=""

src_install() {
	dosym "${P}" /opt/"${PN}"
	dodir /opt/"${P}"
	insinto /opt/
	doins -r "${S}"
	insinto /usr/share/Mathematica/Autoload/FeynArts/
	doins "${FILESDIR}/init.m"
}
