EAPI=8
ESVN_USER="anonymous"
ESVN_PASSWORD="anonymous"

inherit subversion fortran-2

MY_PN="W"
DESCRIPTION="POWHEG BOX V2 W process"

SLOT="0"
LICENSE="GPL-3+"
IUSE=""
KEYWORDS="~amd64"

RDEPEND="
    sci-physics/lhapdf
"

if [[ ${PV} == 9999 ]]; then
    ESVN_FETCH_CMD="svn co"
else
    ESVN_FETCH_CMD="svn --revision ${PV} co"
fi

src_unpack() {
    export ESVN_REPO_URI="svn://powhegbox.mib.infn.it/trunk/POWHEG-BOX-V2"
    subversion_src_unpack
    export ESVN_REPO_URI="svn://powhegbox.mib.infn.it/trunk/User-Processes-V2/${MY_PN}"
    export S="${S}/${P}"
    subversion_src_unpack
    # git-r3_src_unpack
}

src_compile() {
    emake pwhg_main
    mv pwhg_main pwhg_main_${MY_PN}
}

src_install() {
    dobin pwhg_main_${MY_PN}
}