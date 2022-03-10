# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..9} )

inherit bash-completion-r1 autotools distutils-r1

MY_PN="Rivet-"
MY_PF=${MY_PN}${PV}

DESCRIPTION="Rivet toolkit (Robust Independent Validation of Experiment and Theory)"
HOMEPAGE="https://gitlab.com/hepcedar/rivet"
SRC_URI="http://www.hepforge.org/archive/rivet/Rivet-${PV}.tar.gz"
S=${WORKDIR}/${MY_PF}

LICENSE="Open Source License"
SLOT="3"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="+hepmc3 hepmc2 -imagemagick -ghostscript -tex -doc +python"
REQUIRED_USE="hepmc3? ( !hepmc2 ) python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	>=sci-physics/yoda-1.8.0
	sci-physics/fastjet
	sci-physics/fastjet-contrib
	dev-python/cython
	hepmc2? ( =sci-physics/hepmc-2* )
	hepmc3? ( =sci-physics/hepmc-3* )

	sci-libs/gsl
	ghostscript? ( app-text/ghostscript-gpl )
	imagemagick? ( media-gfx/imagemagick )
	tex? ( app-text/texlive-core )

	<dev-lang/python-3.9.9
	python? ( ${PYTHON_DEPS} )
	sys-devel/gcc[fortran]
	"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_configure() {
	use hepmc2 && econf --with-hepmc=/usr --with-bash-completion-dir="$(get_bashcompdir)" $(use_enable doc)
	use hepmc3 && econf --with-hepmc3=/usr --with-bash-completion-dir="$(get_bashcompdir)" $(use_enable doc)

	if use python; then
		cd "${S}"/pyext || die
		distutils-r1_src_prepare
	fi
}

src_compile() {
	default

	if use python; then
		cd "${S}"/pyext || die
		distutils-r1_src_prepare
	fi

}

src_install() {
	if use python; then
		cd "${S}"/pyext || die
		distutils-r1_src_install
	fi

	emake install


	newbashcomp contrib/${PN}-completion ${PN}
}
