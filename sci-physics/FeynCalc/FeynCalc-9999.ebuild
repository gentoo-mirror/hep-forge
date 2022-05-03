# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV=$(ver_rs 1-3 '_')


DESCRIPTION="FeynCalc"
HOMEPAGE="https://feyncalc.github.io/"
SLOT="0"
SRC_URI="https://github.com/FeynCalc/feyncalc/archive/hotfix-stable.tar.gz -> FeynCalc-${PV}.tar.gz"
S="${WORKDIR}/feyncalc-hotfix-stable"

LICENSE="GPL-3+"
KEYWORDS="~amd64"
IUSE="+FCtraditionalFormOutput"
REQUIRED_USE=""

RDEPEND="
	sci-mathematics/mathematica
	"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	mv ${PN}/DocOutput ${PN}/Documentation
	if use FCtraditionalFormOutput; then
		cp ${FILESDIR}/FCConfig.m ${PN}/
	fi
}

src_install() {
	MMADIR=/usr/share/Mathematica/Applications
	dodir $MMADIR/${PN}
	insinto $MMADIR/
	doins -r "${S}/${PN}"
	# copy permissions 
	for f in $(find ${PN}/* ! -type l); do
		fperms --reference="${S}/$f" $MMADIR/$f
	done
}
