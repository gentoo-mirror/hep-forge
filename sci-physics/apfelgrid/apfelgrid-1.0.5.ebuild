# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
PYTHON_COMPAT=( python3_{9..11} )

inherit autotools

DESCRIPTION="Ultra-fast theory predictions for collider observables"
HOMEPAGE="
	https://github.com/nhartland/APFELgrid
	https://github.com/zenaiev/APFELgrid
"
SRC_URI="https://github.com/zenaiev/APFELgrid/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

REQUIRED_USE="
	sci-physics/lhapdf
	sci-physics/apfelxx
	sci-physics/applgrid
"
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
