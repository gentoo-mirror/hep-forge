# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit toolchain-funcs autotools fortran-2 python-single-r1

DESCRIPTION="Library for the evaluation of QCD one-loop matrix elements"
HOMEPAGE="https://blackhat.hepforge.org/"
SRC_URI="https://blackhat.hepforge.org/downloads/?f=blackhat-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE="python"
KEYWORDS="~amd64"

RDEPEND="
	sci-libs/qd
	python? ( ${PYTHON_DEPS} )
"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"


PATCHES=(
#    "${FILESDIR}"/${PN}-0.9.9-std.patch
#	"${FILESDIR}"/${PN}-0.9.9-pair.patch
    "${FILESDIR}"/${PN}-0.9.9-heprpm0.patch
    "${FILESDIR}"/${PN}-0.9.9-heprpm1.patch
    "${FILESDIR}"/${PN}-0.9.9-heprpm2.patch
)


pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	#sed -i -e 's|else return Cached_OLHA_user_normal|else return new Cached_OLHA_user_normal|' src/cached_OLHA.cpp || die
	#find . -type f -exec sed -i -e 's|const vector|const std::vector|g' {} \;
	econf \
		CXXFLAGS="${CXXFLAGS} -Wno-deprecated -std=c++98" \
		--with-QDpath="${EPREFIX}"/usr \
		$(usex python "--enable-pythoninterface" "") \
		--enable-dependency-tracking   --disable-rpath 

	sed -i -e "s|-p .DIR|-p ${ED}\$DIR|g" dataInstall || die
}

