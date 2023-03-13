EAPI=8

PYTHON_COMPAT=( python3_{9..10} )

inherit python-single-r1

DESCRIPTION="A PDF Evolution Library"
HOMEPAGE="
	https://apfel.hepforge.org/
	https://apfel.mi.infn.it/
	https://github.com/scarrazza/apfel
"
SRC_URI="https://github.com/scarrazza/apfel/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3+"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	sci-physics/lhapdf
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/fortran
"

src_configure() {
	default
	econf
}

src_compile() {
	default
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
