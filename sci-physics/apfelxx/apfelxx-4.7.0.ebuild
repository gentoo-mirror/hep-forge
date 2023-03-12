# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="Object oriented rewriting of the APFEL evolution code"
HOMEPAGE="https://github.com/vbertone/apfelxx"
SRC_URI="https://github.com/vbertone/apfelxx/archive/${PV}.tar.gz"

LICENSE="GPL-3.0"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
