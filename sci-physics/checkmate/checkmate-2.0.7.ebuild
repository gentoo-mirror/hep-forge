EAPI=8

inherit autotools

MY_P=CheckMATEbeta-2.0.
DESCRIPTION="Checkmate"
SRC_URI="https://checkmate.hepforge.org/downloads?f=CheckMATEbeta-${PV}.tar.gz"
HOMEPAGE="https://checkmate.hepforge.org/"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-3+"
SLOT="2"
KEYWORDS="~amd64"

RDEPEND="
    dev-lang/python:2.7
    sci-physics/fastjet
	sci-physics/delphes
    sci-physics/root
    sci-physics/madgraph5
    sci-physics/hepmc:3
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
    sed -i -e 's/DelphesHepMCReader/DelphesHepMC3Reader/g' 
}

src_configure() {
    ./configure --with-python=`which python2` \
    --with-pythia=${ESYSROOT}/usr/$(get_libdir)/ \
    --with-hepmc=${ESYSROOT}/usr/$(get_libdir)/ \
    --with-madgraph=${ESYSROOT}/opt/MadGraph5/ \
    --with-delphes=${ESYSROOT}/usr/$(get_libdir)/
}