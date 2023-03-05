# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Exploring the sensitivity of unfolded collider measurements to BSM models."
HOMEPAGE="https://gitlab.com/hepcedar/contur/"
SRC_URI="https://gitlab.com/hepcedar/contur/-/archive/${P}/${PN}-${P}.tar.gz"
S="${WORKDIR}"/${PN}-${P}

LICENSE="GPL-3"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="
	sci-physics/rivet
	sci-physics/yoda
"
RDEPEND="${DEPEND}"
BDEPEND=""
