# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="POWHEG BOX is a general computer framework for implementing NLO calculations in shower Monte Carlo programs according to the POWHEG method"
SLOT="0"
IUSE="doc examples"

RDEPEND="
	~sci-physics/powheg-box-v2-hvq-${PV}[doc?,examples?]
	~sci-physics/powheg-box-v2-directphoton-${PV}[doc?,examples?]
	~sci-physics/powheg-box-v2-dijet-${PV}[doc?,examples?]
	~sci-physics/powheg-box-v2-trijet-${PV}[doc?,examples?]
	~sci-physics/powheg-box-v2-Z-${PV}[doc?,examples?]
	~sci-physics/powheg-box-v2-Zj-${PV}[doc?,examples?]
	~sci-physics/powheg-box-v2-W-${PV}[doc?,examples?]
"
