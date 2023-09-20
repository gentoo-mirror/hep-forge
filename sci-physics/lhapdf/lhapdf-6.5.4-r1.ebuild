# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DOCS_BUILDER="doxygen"
DOCS_DEPEND="
	dev-texlive/texlive-bibtexextra
	dev-texlive/texlive-fontsextra
	dev-texlive/texlive-fontutils
	dev-texlive/texlive-latex
	dev-texlive/texlive-latexextra
"
inherit python-single-r1 docs
LHA_VER="6.2.1"

# Alternatively to fetching them here already the user can install them by lhapdf install, but some codes need them during test stage
# Also since it belongs to LHAPDF it is better to fetch them here
SRC_URI="
		ct14lo? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/CT14lo.tar.gz )
		ct14nlo? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/CT14nlo.tar.gz )
		ct10? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/CT10.tar.gz )
		mrst2007lomod? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/MRST2007lomod.tar.gz )
		nnpdf23_nlo_as_0119_qed_mc? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/NNPDF23_nlo_as_0119_qed_mc.tar.gz ) 
		nnpdf23_nnlo_as_0119_qed_mc? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/NNPDF23_nnlo_as_0119_qed_mc.tar.gz ) 
		cteq66? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/cteq66.tar.gz )
		cteq6l1? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/cteq6l1.tar.gz ) 
		mrst2004qed? ( https://www.hepforge.org/downloads/lhapdf/pdfsets/v6.backup/${LHA_VER}/MRST2004qed.tar.gz )
		"

MY_PV=$(ver_cut 1-3)
MY_PF=LHAPDF-${MY_PV}

DESCRIPTION="Les Houches Parton Density Function unified library"
HOMEPAGE="https://lhapdf.hepforge.org/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/hepcedar/lhapdf"
else
	SRC_URI="https://www.hepforge.org/downloads/lhapdf/${MY_PF}.tar.gz
	$SRC_URI"
	S="${WORKDIR}/${MY_PF}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="examples mrst2004qed ct10 mrst2007lomodct14lo ct14nlo cteq66  nnpdf23_nlo_as_0119_qed_mc nnpdf23_nnlo_as_0119_qed_mc"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

src_configure() {
	CONFIG_SHELL="${EPREFIX}/bin/bash" \
	econf \
		--disable-static \
		--enable-python
}

src_compile() {
	emake all $(use doc && echo doxy)
}

src_test() {
	emake -C tests
}

src_install() {
	default
	use doc && dodoc -r doc/doxygen/.
	use examples && dodoc examples/*.cc

	python_optimize

	find "${ED}" -name '*.la' -delete || die

	# install pdfsets into /usr/share/LHAPDF
	insinto /usr/share/LHAPDF
	use mrst2004qed && doins -r MRST2004qed
	use ct10 && doins -r CT10
	use mrst2007lomod && doins -r MRST2007lomod
	use ct14lo && doins -r CT14lo
	use ct14nlo && doins -r CT14nlo
	use cteq66 && doins -r cteq66
	use nnpdf23_nlo_as_0119_qed_mc && doins -r NNPDF23_nlo_as_0119_qed_mc
	use nnpdf23_nnlo_as_0119_qed_mc && doins -r NNPDF23_nnlo_as_0119_qed_mc
}
