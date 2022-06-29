# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )
DISTUTILS_USE_SETUPTOOLS=no

inherit bash-completion-r1 autotools distutils-r1 flag-o-matic

MY_PN="Rivet-"
MY_PF=${MY_PN}${PV}

DESCRIPTION="Rivet toolkit (Robust Independent Validation of Experiment and Theory)"
HOMEPAGE="https://gitlab.com/hepcedar/rivet"
SRC_URI="http://www.hepforge.org/archive/rivet/Rivet-${PV}.tar.gz"
S=${WORKDIR}/${MY_PF}

LICENSE="GPL-3+"
SLOT="3"
KEYWORDS="~amd64"
IUSE="+hepmc3 hepmc2 tex imagemagick ghostscript doc +python"
REQUIRED_USE="
hepmc3? ( !hepmc2 )
python? ( ${PYTHON_REQUIRED_USE} )
"

RDEPEND="
	>=sci-physics/yoda-1.9.4
	>=sci-physics/fastjet-3.4.0[plugins]
	>=sci-physics/fastjet-contrib-1.046
	>=dev-python/cython-0.29.24
	hepmc2? ( ~sci-physics/hepmc:2=[-cm,gev] )
	hepmc3? ( ~sci-physics/hepmc:3=[-cm,gev] )

	sci-libs/gsl
	ghostscript? ( app-text/ghostscript-gpl )
	imagemagick? ( media-gfx/imagemagick )
	tex? ( app-text/texlive-core )

	<dev-lang/python-3.9.9:=
	python? ( ${PYTHON_DEPS} )
	sys-devel/gcc:=[fortran]
	"
DEPEND="${RDEPEND}"
BDEPEND="
"
PATCHES=(
"${FILESDIR}"/${P}-doc.patch
"${FILESDIR}"/${P}-std.patch
)

src_prepare() {
	default
	#use doc || sed -i -e 's#AC_CONFIG_FILES(doc/Makefile doc/doxygen/Doxyfile)##' "${S}"/configure.ac || die
	#use doc || sed -i -e 's#SUBDIRS = src pyext data include bin analyses test doc#SUBDIRS = src pyext data include bin analyses test#' "${S}"/Makefile.am || die
	eautoreconf
}

src_configure() {
	append-cxxflags -std=c++17
	append-cppflags -std=c++17
	# Rivet does not like econf for some reason
	use hepmc2 && ./configure --prefix=/usr --with-hepmc=/usr --with-yoda=/usr --with-fastjet=/usr --libdir=/usr/$(get_libdir)
	use hepmc3 && ./configure --prefix=/usr --with-hepmc3=/usr --with-yoda=/usr --with-fastjet=/usr --libdir=/usr/$(get_libdir)

	if use python; then
		cd "${S}"/pyext || die
		distutils-r1_src_prepare
	fi
}

src_compile() {
	default

	if use python; then
		cd "${S}"/pyext || die
		distutils-r1_src_compile
	fi

}

src_install() {
	if use python; then
		tp=$(pwd)
		cd "${S}"/pyext || die
		distutils-r1_src_install
		cd $tp
	fi

	default

	newbashcomp "${ED}"/usr/etc/bash_completion.d/${PN}-completion ${PN}
	rm "${ED}"/usr/etc/bash_completion.d/${PN}-completion || die
}
