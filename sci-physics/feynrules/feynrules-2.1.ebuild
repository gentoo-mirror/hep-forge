# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=FeynRules
MY_P=${MY_PN}-${PV}

DESCRIPTION="A Mathematica package to calculate Feynman rules."
HOMEPAGE="https://feynrules.irmp.ucl.ac.be"
SRC_URI="https://feynrules.irmp.ucl.ac.be/raw-attachment/wiki/WikiStart/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

# No license given
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-mathematics/mathematica
"
DEPEND="${RDEPEND}"

src_install() {
	MMADIR=/usr/share/Mathematica/Applications
	INSDIR="${MMADIR}/${MY_P}"
	dosym "${MY_P}" "${MMADIR}/${MY_PN}"
	dodir "${INSDIR}"
	insinto ${MMADIR}
	doins -r "${S}"
	elog "In Mathematica use \$FeynRulesPath=SetDirectory[\"${INSDIR}\"] before <<FeynRules\`"
}
