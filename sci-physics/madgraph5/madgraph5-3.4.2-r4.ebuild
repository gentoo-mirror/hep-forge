# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
inherit python-single-r1

MY_PV=$(ver_rs 1-3 '_')
MY_PN="MG5_aMC_v"
MY_PF=${MY_PN}${MY_PV}

DESCRIPTION="MadGraph5_aMC@NLO"
HOMEPAGE="https://launchpad.net/mg5amcnlo"
SRC_URI="https://launchpad.net/mg5amcnlo/$(ver_cut 1).0/$(ver_cut 1-2).x/+download/${MY_PN}${PV}.tar.gz"
S=${WORKDIR}/${MY_PF}

LICENSE="UoI-NCSA"
SLOT="3"
KEYWORDS="~amd64"
IUSE="+lhapdf +fastjet +pythia +ninja +samurai +collier +pineappl +thepeg +herwig +hepmc"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sys-libs/zlib
	sys-devel/gcc:*[fortran]
	acct-group/madgraph
	lhapdf? ( sci-physics/lhapdf[${PYTHON_SINGLE_USEDEP}] )
	fastjet? ( sci-physics/fastjet[${PYTHON_SINGLE_USEDEP}] )
	pythia? ( sci-physics/pythia )
	hepmc? ( sci-physics/hepmc:2 sci-physics/hepmc:3 )
	"
PATCHES=( "${FILESDIR}"/cuttools.patch )
DEPEND="${RDEPEND}"
BDEPEND=""

src_unpack() {
	tar xvzf "${DISTDIR}/${MY_PN}${PV}.tar.gz" -C "${WORKDIR}"
}

src_configure() {
	use lhapdf && echo "lhapdf_py3 = lhapdf-config" >> input/mg5_configuration.txt
	use fastjet && echo "fastjet = fastjet-config" >> input/mg5_configuration.txt
	use pythia && echo "pythia8_path = ${EROOT}" >> input/mg5_configuration.txt
	#use hepmc && echo ""
	echo "auto_update = 0" >> input/mg5_configuration.txt
}

src_install() {
	# symlink entrypoint
	dosym ../../opt/${MY_PF}/bin/mg5_aMC /usr/bin/mg5_aMC3
	dodir /opt/${MY_PF}
	insinto /opt/
	doins -r "${S}"
	cd "${S}"
	# Copy executable, etc. permissions
	for f in $(find * ! -type l); do
		fperms --reference="${S}/$f" /opt/${MY_PF}/$f
	done
	fperms -R a=u /opt/${MY_PF}
}