# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit cmake python-r1

MYP=HepMC3-${PV}

DESCRIPTION="Event Record for Monte Carlo Generators"
HOMEPAGE="https://hepmc.web.cern.ch/hepmc/"
SRC_URI="https://hepmc.web.cern.ch/hepmc/releases/${MYP}.tar.gz"
S="${WORKDIR}/${MYP}"

LICENSE="GPL-2"
SLOT="3"
KEYWORDS="~amd64"
IUSE="doc test example cm gev python root"
RESTRICT="!test? ( test )"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
"
BDEPEND="
	${PYTHON_DEPS}
	root? ( sci-physics/root:= )
	doc? (
		app-doc/doxygen
		dev-texlive/texlive-latex
		dev-texlive/texlive-latexextra
		dev-texlive/texlive-latexrecommended
	)
"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	# use geV over GeV and mm over cm
	local mycmakeargs=(
		-Dlength=$(usex cm CM MM)
		-Dmomentum=$(usex gev GEV MEV)
		-DHEPMC3_ENABLE_ROOTIO=$(usex root ON OFF)
		-DHEPMC3_ENABLE_PYTHON=$(usex python ON OFF)
		-DHEPMC3_ENABLE_TEST=$(usex test ON OFF)
		-DHEPMC3_BUILD_DOCS=$(usex doc ON OFF)
		-DHEPMC3_BUILD_EXAMPLES=$(usex example ON OFF)
		#-DHEPMC3_INSTALL_INTERFACES=$(usex interfaces ON OFF)
		#-DHEPMC3_USE_INTERFACE_FROM_PYTHIA8=$(usex pythia ON OFF)
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	if use doc; then
		cd doc || die
		./buildDoc.sh || die
		./buildDoxygen.sh || die
		HTML_DOCS=( doc/html/. )
	fi
}

src_install() {
	cmake_src_install
	use doc && dodoc doc/*.pdf
}
