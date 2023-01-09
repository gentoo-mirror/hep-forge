# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake

DESCRIPTION="Delphes performs a fast multipurpose detector response simulation."
HOMEPAGE="
	https://github.com/delphes/delphes
	http://cp3.irmp.ucl.ac.be/projects/delphes
"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/delphes/delphes"
else
	SRC_URI="http://cp3.irmp.ucl.ac.be/downloads/Delphes-${PV}.tar.gz"
	# Alternatively https://github.com/delphes/delphes/archive/refs/tags/3.5.0.tar.gz
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3+"
SLOT="0"

DEPEND="
	sci-physics/root:=
	sci-physics/pythia:=
"
RDEPEND="${DEPEND}"
BDEPEND=""
