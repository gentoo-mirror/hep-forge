# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit bash-completion-r1 autotools python-single-r1

DESCRIPTION="Yet more Objects for (High Energy Physics) Data Analysis"
HOMEPAGE="https://yoda.hepforge.org/"
SRC_URI="https://yoda.hepforge.org/downloads?f=${P^^}.tar.bz2 -> ${P^^}.tar.bz2"
S="${WORKDIR}/${P^^}"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="root python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	root? ( sci-physics/root:=[${PYTHON_SINGLE_USEDEP}] )
	python? ( ${PYTHON_DEPS} )
"

DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-python3.10.patch"
)

src_prepare() {
	default
	# reconf due to python3_10 patch
	eautoreconf
}

src_configure() {
	econf --disable-static $(use_enable root) $(use_enable python pyext)
}

src_compile() {
	default
}

src_test() {
	if use python; then
		emake check
	else
		# PYTESTS and SHTESTS both require python tools
		emake check PYTESTS= SHTESTS=
	fi
}

src_install() {
	emake install DESTDIR="${ED}"

	newbashcomp "${ED}"/etc/bash_completion.d/${PN}-completion yoda
	rm "${ED}"/etc/bash_completion.d/${PN}-completion || die

	find "${ED}" -name '*.la' -delete || die
}
