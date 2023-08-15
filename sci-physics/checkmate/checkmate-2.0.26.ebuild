# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
PYTHON_COMPAT=( python3_11 )
inherit autotools python-single-r1

MY_P=CheckMATE-2.0.
DESCRIPTION="Check Models At Terascale Energies"
HOMEPAGE="https://checkmate.hepforge.org/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/CheckMATE2/checkmate2/"
else
    SRC_URI="https://checkmate.hepforge.org/downloads?f=CheckMATE-${PV}.tar.gz -> checkmate-2.0.7.tar.gz"
	S="${WORKDIR}/${MY_P}"
	# Alternatively https://github.com/delphes/delphes/archive/refs/tags/3.5.0.tar.gz
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64"

RDEPEND="
	${PYTHON_DEPS}
    dev-python/future
    dev-python/scipy
    sci-physics/root:=[${PYTHON_SINGLE_USEDEP}]
    sci-physics/fastjet
	>=sci-physics/delphes-3.5
    sci-physics/root
    >=sci-physics/madgraph5-2.7[${PYTHON_SINGLE_USEDEP}]
    sci-physics/hepmc:2
    <sci-physics/pythia-8.3
"
DEPEND="${RDEPEND}"
BDEPEND=""

PATCHES=(
    "${FILESDIR}"/${PN}-external.patch
    "${FILESDIR}"/${PN}-delphes-hepmc-reader.patch
)

src_prepare() {
    default
    eautoreconf
}

src_configure() {
    econf \
    --with-pythia=${ESYSROOT}/usr/$(get_libdir)/ \
    --with-hepmc=${ESYSROOT}/usr/$(get_libdir)/ \
    --with-madgraph=${ESYSROOT}/opt/MadGraph5/ \
    --with-delphes=${ESYSROOT}/usr/$(get_libdir)/
}