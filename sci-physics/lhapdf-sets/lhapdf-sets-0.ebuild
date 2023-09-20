# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
LHA_VER="6.2.1"

# Alternatively to fetching them here already the user can install them by lhapdf install, but some codes need them during test stage
# Also since it belongs to LHAPDF it is better to fetch them here
SRC_URI="
		nnpdf31_nnlo_as_0118_luxqed? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/NNPDF31_nnlo_as_0118_luxqed.tar.gz )
		pdf4lhc15_nlo_asvar? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/PDF4LHC15_nlo_asvar.tar.gz )
		ct14qed_proton? ( https://lhapdfsets.web.cern.ch/lhapdfsets/current/CT14qed_proton.tar.gz )
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
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}"

LICENSE="GPL-2"
SLOT="0"
IUSE="mrst2004qed ct10 mrst2007lomod ct14lo ct14nlo cteq66 cteq6l1 nnpdf23_nlo_as_0119_qed_mc nnpdf23_nnlo_as_0119_qed_mc nnpdf31_nnlo_as_0118_luxqed pdf4lhc15_nlo_asvar ct14qed_proton"
RDEPEND="sci-physics/lhapdf"
DEPEND="${RDEPEND}"

src_unpack() {
	# unpack in destination only to avoid copy
	return
}

src_install() {
	dodir /usr/share/LHAPDF/
	cd "${ED}/usr/share/LHAPDF/" || die
	unpack ${A}
}
