# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )
DISTUTILS_USE_SETUPTOOLS=no

inherit bash-completion-r1 autotools distutils-r1


DESCRIPTION="Yet more Objects for (High Energy Physics) Data Analysis"
HOMEPAGE="https://yoda.hepforge.org/"
SRC_URI="https://yoda.hepforge.org/downloads?f=${P^^}.tar.bz2 -> ${P^^}.tar.bz2"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="root python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	root? ( sci-physics/root:= )
	python? ( ${PYTHON_DEPS} )
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${P^^}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf --disable-static $(use_enable root) --disable-pyext

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
	#emake check PYTESTS= SHTESTS=
	emake check
}

src_install() {
	default

	if use python; then
		tp=$(pwd)
		cd "${S}"/pyext || die
		distutils-r1_src_install
		cd $tp
	fi

	newbashcomp "${ED}"/etc/bash_completion.d/${PN}-completion yoda
	rm "${ED}"/etc/bash_completion.d/${PN}-completion || die
}

