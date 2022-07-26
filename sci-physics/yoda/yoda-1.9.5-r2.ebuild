# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=no
DISTUTILS_SINGLE_IMPL=1

inherit bash-completion-r1 autotools distutils-r1

DESCRIPTION="Yet more Objects for (High Energy Physics) Data Analysis"
HOMEPAGE="https://yoda.hepforge.org/"
SRC_URI="https://yoda.hepforge.org/downloads?f=${P^^}.tar.bz2 -> ${P^^}.tar.bz2"

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

S="${WORKDIR}/${P^^}"

src_configure() {
	econf --disable-static $(use_enable root) $(use_enable python pyext)

	if use python; then
		cd "${S}"/pyext || die
		distutils-r1_src_prepare
	fi
}

src_compile() {
	default

	if use python; then
		cd "${S}"/pyext || die
		distutils-r1_src_compile
	fi

}

src_test() {
	# PYTESTS and SHTESTS both require python tools
	if use python; then
		emake check
	else
		emake check PYTESTS= SHTESTS=
	fi
}

src_install() {
	default

	newbashcomp "${ED}"/etc/bash_completion.d/${PN}-completion yoda
	rm "${ED}"/etc/bash_completion.d/${PN}-completion || die
	if use python; then
		cd "${S}"/pyext || die
		distutils-r1_src_install
	fi
}
