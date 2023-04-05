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
	"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	use lhapdf && echo "lhapdf_py3 = lhapdf-config" >> input/mg5_configuration.txt
	use fastjet && echo "fastjet = fastjet-config" >> input/mg5_configuration.txt
	use pythia && echo "pythia8_path = ${EROOT}" >> input/mg5_configuration.txt
	#use hepmc && echo ""
	echo "auto_update = 0" >> input/mg5_configuration.txt
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

