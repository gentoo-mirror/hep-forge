# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="FeynArts"
HOMEPAGE="http://feynarts.de"
SRC_URI="http://feynarts.de/${P}.tar.gz"

LICENSE="Open Source License"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE=""
REQUIRED_USE=""

RDEPEND="
	sci-mathematics/mathematica
	"
DEPEND="${RDEPEND}"
BDEPEND=""

src_install() {
	dodir /opt/${P}
	insinto /opt/
	doins -r "${S}"
	dosym /opt/${P} /opt/${PN}
	insinto /usr/share/Mathematica/Autoload/FeynArts/
	doins ${FILESDIR}/init.m
}
