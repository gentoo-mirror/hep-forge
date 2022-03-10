# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


MY_PN="Rivet-"
MY_PF=${MY_PN}${PV}

DESCRIPTION="Rivet toolkit (Robust Independent Validation of Experiment and Theory)"
HOMEPAGE="https://gitlab.com/hepcedar/rivet"
SRC_URI="http://www.hepforge.org/archive/rivet/Rivet-${PV}.tar.gz"
S=${WORKDIR}/${MY_PF}

LICENSE="Open Source License"
SLOT="3"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="+hepmc3 hepmc2 -imagemagick -ghostscript -tex"
REQUIRED_USE="hepmc3? ( !hepmc2 )"

RDEPEND="
	sci-physics/yoda
	sci-physics/fastjet
	dev-python/cython
	hepmc2? ( =sci-physics/hepmc-2* )
	hepmc3? ( =sci-physics/hepmc-3* )

	sci-libs/gsl
	ghostscript? ( app-text/ghostscript-gpl )
	imagemagick? ( media-gfx/imagemagick )
	tex? ( app-text/texlive-core )

	dev-lang/python
	sys-devel/gcc[fortran]
	"
DEPEND="${RDEPEND}"
BDEPEND="
"

src_configure() {
	use hepmc2 && econf --with-hepmc=/usr --with-bash-completion-dir="$(get_bashcompdir)"
	use hepmc3 && econf --with-hepmc3=/usr --with-bash-completion-dir="$(get_bashcompdir)"
}

src_install() {
	default

	newbashcomp contrib/${PN}-completion ${PN}
}
