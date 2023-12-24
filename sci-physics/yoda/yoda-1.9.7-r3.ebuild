# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# python3_11 missing in sci-physics/root
PYTHON_COMPAT=( python3_{9..11} )

inherit bash-completion-r1 autotools python-single-r1 optfeature

DESCRIPTION="Yet more Objects for (High Energy Physics) Data Analysis"
HOMEPAGE="https://yoda.hepforge.org/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/hepcedar/yoda"
else
	SRC_URI="https://yoda.hepforge.org/downloads?f=${P^^}.tar.bz2 -> ${P^^}.tar.bz2"
	S="${WORKDIR}/${P^^}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="1"
IUSE="root +python +zlib"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} ) root? ( python )"

RDEPEND="
	root? ( sci-physics/root:=[${PYTHON_SINGLE_USEDEP}] )
	python? (
		${PYTHON_DEPS}
	)
	zlib? ( sys-libs/zlib )
"
DEPEND="${RDEPEND}"

PATCHES=()

pkg_setup() {
    use python && python-single-r1_pkg_setup
}

src_prepare() {
	default
	# reconf due to python3_10 patch
	eautoreconf
}

src_configure() {
	econf --disable-static $(use_enable root) $(use_enable python pyext) $(use_with zlib zlib "${ESYSROOT}/usr")
}

src_test() {
	# PYTESTS and SHTESTS both require python tools
	emake check PYTESTS= SHTESTS=
}

src_install() {
	emake install DESTDIR="${D}"

	newbashcomp "${ED}"/etc/bash_completion.d/${PN}-completion ${PN}
	rm "${ED}"/etc/bash_completion.d/${PN}-completion || die

	use python && python_optimize
	find "${ED}" -name '*.la' -delete || die
}

pkg_postinst() {
	optfeature "plotting support" virtual/latex-base dev-python/matplotlib
}
