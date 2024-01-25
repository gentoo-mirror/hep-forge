EAPI=8
ESVN_USER="anonymous"
ESVN_PASSWORD="anonymous"

inherit subversion fortran-2

MY_PN="trijet"
DESCRIPTION="POWHEG BOX V2 trijet process"
HOMEPAGE="http://powhegbox.mib.infn.it/"

SLOT="0"
LICENSE="GPL-3+"
IUSE="doc examples +zlib"

RDEPEND="
	sci-physics/lhapdf
	sci-physics/fastjet
	zlib? ( sys-libs/zlib )
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
	emake pwhg_main WITHZLIB=$(usex zlib yes no)
	mv pwhg_main pwhg_main_${MY_PN}
}

src_install() {
	dobin pwhg_main_${MY_PN}


	if use doc; then
		dodoc -r useful_papers/*
	fi

	if use examples; then
		docinto examples
		dodoc -r testrun-lhc
		docompress -x /usr/share/doc/${PF}/examples
	fi
}