# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

PYTHON_COMPAT=( python3_11 )

inherit autotools python-single-r1

MY_PF="CheckMATE2"
MY_P="CheckMATE-2.0.26"
DESCRIPTION="Check Models At Terascale Energies"
HOMEPAGE="https://checkmate.hepforge.org/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/CheckMATE2/checkmate2/"
else
    SRC_URI="https://checkmate.hepforge.org/downloads?f=CheckMATE-${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${MY_P}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/future
	sci-physics/root:=[${PYTHON_SINGLE_USEDEP}]
	sci-physics/fastjet
	sci-physics/delphes
	sci-physics/root
	sci-physics/pyhf
	sci-physics/madgraph5[${PYTHON_SINGLE_USEDEP}]
	sci-physics/hepmc:2
	<sci-physics/pythia-8.3
"
DEPEND="${RDEPEND}"
BDEPEND=""

PATCHES=(
    "${FILESDIR}"/${PN}-2.0.7-external.patch
    "${FILESDIR}"/${PN}-2.0.7-delphes-hepmc-reader.patch
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf  \
	--with-pythia=${ESYSROOT}/usr/$(get_libdir)/ \
	--with-hepmc=${ESYSROOT}/usr/$(get_libdir)/ \
	--with-madgraph=${ESYSROOT}/opt/MadGraph5/ \
	--with-delphes=${ESYSROOT}/usr/$(get_libdir)/
}

src_install() {
	default
	## install all python files from tools/python
	#insinto /usr/lib/python3.11/site-packages
	#doins -r tools/python/*
	# do opt install
	dosym ../../opt/${MY_PF}/bin/CheckMATE /usr/bin/CheckMATE
	dodir /opt/${MY_PF}
	insinto /opt/${MY_PF}
	doins -r *
	# Fix for missing empty directories, check keepdir install function explanation
	for f in $(find . -type d -empty); do
		keepdir /opt/${MY_PF}/$f
	done
	# Copy executable, etc. permissions
	for f in $(find * ! -type l); do
		fperms --reference="$f" ${ED}/opt/${MY_PF}/$f
	done
	fperms -R a=u /opt/${MY_PF}
	fperms a=u /opt/${MY_PF}
}
