# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )

inherit autotools bash-completion-r1 python-single-r1

DESCRIPTION="Toolkit for validation of Monte Carlo HEP event generators"
HOMEPAGE="http://rivet.hepforge.org/"

SRC_URI="http://www.hepforge.org/archive/${PN}/${P^}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="python static-libs"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	dev-libs/boost:=
	sci-libs/gsl:=
	sci-physics/fastjet[plugins]
	sci-physics/hepmc
	sci-physics/yoda:=[python]
	python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}
	python? ( dev-python/cython[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${P^}"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_unpack() {
	unpack "${P^}.tar.bz2"
}

src_prepare() {
	default

	# Install rivet-manual.pdf to docdir intead of pkgdatadir
	sed -i '/pkgdata_DATA = $(DOCS)/s/pkgdata/doc/' doc/Makefile.am || die
	# Adjust shebangs of Python scripts
	sed -i "s@^#! /usr/bin/env python@#!${EPREFIX}/usr/bin/python2@" bin/* || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable python pyext) \
		$(use_enable static-libs static) 
}

src_install() {
	default
	newbashcomp "${ED%/}"/usr/share/Rivet/rivet-completion rivet
	rm -f "${ED%/}"/usr/share/Rivet/rivet-completion || die
}
