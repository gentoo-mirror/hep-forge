# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
inherit python-single-r1

MY_PF="MadAnalysis5"

DESCRIPTION="A package for event file analysis and recasting of LHC results"
HOMEPAGE="
    https://github.com/MadAnalysis/madanalysis5
"
SRC_URI="https://github.com/MadAnalysis/madanalysis5/archive/refs/tags/v${PV}.tar.gz"
S=${WORKDIR}/madanalysis5-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sys-libs/zlib
	sci-physics/fastjet[${PYTHON_SINGLE_USEDEP}]
	sci-physics/root[${PYTHON_SINGLE_USEDEP}]
    sci-physics/delphes

	$(python_gen_cond_dep '
		=sci-physics/pyhf-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.19.5[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.7.1[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.4.2[${PYTHON_USEDEP}]
		>=dev-python/lxml-4.6.2[${PYTHON_USEDEP}]
	')
	"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	default 
}

src_install() {
	# symlink entrypoint
	dosym ../../opt/${MY_PF}/bin/ma5 /usr/bin/ma5
	dodir /opt/${MY_PF}
	insinto /opt/
	doins -r "${S}"
	cd "${S}"
	# Copy executable, etc. permissions
	for f in $(find * ! -type l); do
		fperms --reference="${S}/$f" /opt/${MY_PF}/$f
	done
	fperms -R g=u /opt/${MY_PF}

	#fperms +x /opt/${MY_PF}/bin/mg5_aMC
	fowners :madgraph -R /opt/${MY_PF}
}

pkg_postinst() {
	elog "YOU MUST add your user to the madgraph group"
	elog "eg. sudo usermod -a -G madgraph username"
	elog "Running sessions must be restarted"
	elog ""
	elog "Automatic updates disabled, modified in: "
	elog "/opt/${MY_PF}/input/mg5_configuration.txt"
}

