# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake

DESCRIPTION="PDF fitting tool"
HOMEPAGE="https://www.xfitter.org/xFitter/xFitter"
SRC_URI="https://www.xfitter.org/xFitter/xFitter/DownloadPage?action=AttachFile&do=get&target=xfitter-${PV}.tgz -> ${P}.zip}"

LICENSE="GPL-3+"
RESTRICT=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="lhapdf applgrid apfel apfelxx ceres hathor pineappl +root +qcdnum"

DEPEND="
    dev-libs/libyaml
	~sci-physics/lhapdf-6.5.4
	~sci-physics/dyturbo-1.3.2
	~sci-physics/hoppet-1.2.0
	root? ( sci-physics/root )
	apfel? ( sci-physics/apfel )
	apfelxx? ( ~sci-physics/apfelxx-4.0.0 )
	qcdnum? ( ~sci-physics/qcdnum-18.00.00 )
	hathor? ( ~sci-physics/hather-2.0 )
	applgrid? ( ~sci-physics/apfelgrid-1.0.5 )
	pineappl? ( ~sci-physics/pineappl_capi-0.6.1 )
	ceres? ( sci-libs/ceres-solver )
"

RDEPEND="${DEPEND}"
BDEPEND="
    virtual/lapack
    virtual/blas
	virtual/fortran
    virtual/rust
"
