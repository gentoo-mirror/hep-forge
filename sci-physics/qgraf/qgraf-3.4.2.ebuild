# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="qgraf generates Feynman diagrams for various types of QFT models"
HOMEPAGE="http://cfif.ist.utl.pt/~paulo/qgraf.html"
SRC_URI="http://anonymous:anonymous@qgraf.tecnico.ulisboa.pt/v3.4/qgraf-${PV}.tgz"
S=${WORKDIR}

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64"

IUSE="doc examples"
DEPEND="virtual/fortran" #gfortran
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	gfortran ${P}.f -o qgraf
}

src_install() {
	dobin qgraf

	use doc && dodoc *.pdf
	if use examples; then
		docinto examples
		dodoc phi3 qed qcd *.sty *.dat
        docompress -x /usr/share/doc/${PF}/examples

	fi
}
