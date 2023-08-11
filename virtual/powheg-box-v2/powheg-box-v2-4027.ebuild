# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="NLO calculations in shower Monte Carlo programs according to the POWHEG method"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	~sci-physics/powheg-box-v2-hvq-${PV}
	~sci-physics/powheg-box-v2-directphoton-${PV}
	~sci-physics/powheg-box-v2-dijet-${PV}
	~sci-physics/powheg-box-v2-trijet-${PV}
	~sci-physics/powheg-box-v2-Z-${PV}
	~sci-physics/powheg-box-v2-Zj-${PV}
	~sci-physics/powheg-box-v2-W-${PV}
"
