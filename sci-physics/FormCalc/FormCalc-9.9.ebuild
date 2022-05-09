# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="FormCalc"
HOMEPAGE="http://feynarts.de/formcalc"
SRC_URI="http://feynarts.de/formcalc/${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="form"
REQUIRED_USE=""

RDEPEND="
	sci-mathematics/mathematica
	form? ( sci-mathematics/form )
	"
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile() {
	export DEST=Linux-x86-64
	./compile
	# remove shipped form
	if use form; then
		rm Linux-x86-64/form
	fi
}

src_install() {
	dodir /opt/${P}
	insinto /opt/
	doins -r "${S}"
	cd "${S}"
	# Copy executable, etc. permissions
	for f in $(find * ! -type l); do
		fperms --reference="${S}/$f" /opt/${P}/$f
	done
	# switch to system form
	if use form; then
		dosym `which form` /opt/${P}/Linux-x86-64/form
	fi
	dosym /opt/${P} /opt/${PN}
	insinto /usr/share/Mathematica/Autoload/FormCalc/
	doins "${FILESDIR}/init.m"
}
