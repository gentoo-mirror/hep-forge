# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit python-single-r1

MY_PNN="MadGraph5"
MY_PV=$(ver_rs 1-3 '_')
MY_PN="MG5_aMC_v"
MY_PF=${MY_PN}${MY_PV}

DESCRIPTION="MadGraph5_aMC@NLO"
HOMEPAGE="https://launchpad.net/mg5amcnlo"
SRC_URI="https://launchpad.net/mg5amcnlo/$(ver_cut 1).0/$(ver_cut 1-2).x/+download/${MY_PN}${PV}.tar.gz -> ${MY_PNN}-${PV}.tar.gz"
S=${WORKDIR}/${MY_PF}

LICENSE="UoI-NCSA"
SLOT="3"
KEYWORDS="~amd64"
# TODO add pineapple, herwig, syscalc, pjfry
IUSE="+lhapdf +fastjet +pythia -ninja -samurai -collier +pineappl -golem95 +thepeg +rivet +herwig +hepmc +madanalysis5 td"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sys-libs/zlib
	sys-devel/gcc:*[fortran]
	$(python_gen_cond_dep '
        dev-python/numpy[${PYTHON_USEDEP}]
    ')
	lhapdf? ( sci-physics/lhapdf[${PYTHON_SINGLE_USEDEP}] )
	fastjet? ( sci-physics/fastjet[${PYTHON_SINGLE_USEDEP}] )
	pythia? ( sci-physics/pythia )
	hepmc? ( sci-physics/hepmc:2 sci-physics/hepmc:3 )
	collier? ( sci-physics/collier )
	td? ( sci-physics/topdrawer )
	thepeg? ( sci-physics/thepeg[hepmc?,fastjet?,lhapdf?] )
	ninja? ( sci-physics/ninja )
	samurai? ( dev-util/samurai )
	golem95? ( sci-physics/golem95 )
"
PATCHES=( "${FILESDIR}"/cuttools.patch )
DEPEND="${RDEPEND}"
BDEPEND=""

# Perserve permissions
src_unpack() {
	tar xvzf "${DISTDIR}/${MY_PNN}-${PV}.tar.gz" -C "${WORKDIR}"
}

src_configure() {
	use lhapdf && echo "lhapdf_py3 = lhapdf-config" >> input/mg5_configuration.txt
	use fastjet && echo "fastjet = fastjet-config" >> input/mg5_configuration.txt
	use pythia && echo "pythia8_path = ${EPREFIX}/" >> input/mg5_configuration.txt
	use hepmc && echo "hepmc_path = ${EPREFIX}/" >> input/mg5_configuration.txt
	# MG does not like recent collier nor ninja yet
	# use collier && echo "collier = ${EPREFIX}/usr/$(get_libdir)" >> input/mg5_configuration.txt
	# use ninja && echo "ninja = ${EPREFIX}/usr/$(get_libdir)" >> input/mg5_configuration.txt
	#use samurai && echo "samurai = ${EPREFIX}/usr/$(get_libdir)" >> input/mg5_configuration.txt
	#use golem95 && echo "golem = ${EPREFIX}/usr/$(get_libdir)" >> input/mg5_configuration.txt
	use td && echo "td_path = ${EPREFIX}/usr/bin/td" >> input/mg5_configuration.txt
	use thepeg && echo "thepeg_path = ${EPREFIX}/usr/$(get_libdir)" >> input/mg5_configuration.txt
	use madanalysis5 && echo "madanalysis5_path = ${EPREFIX}/opt/MadAnalysis5/" >> input/mg5_configuration.txt
	#use hepmc && echo ""
	echo "auto_update = 0" >> input/mg5_configuration.txt
}

src_install() {
	# symlink entrypoint
	dosym ../../opt/${MY_PF}/bin/mg5_aMC /usr/bin/mg5_aMC3
	dosym  ../opt/${MY_PF} /opt/"${MY_PNN}"
	dodir /opt/${MY_PF}
	insinto /opt/
	doins -r "${S}"
	# Fix for missing empty directories, check keepdir install function explanation
	for f in $(find . -type d -empty); do
		keepdir /opt/${MY_PF}/$f
	done
	cd "${S}"
	# Copy executable, etc. permissions
	for f in $(find * ! -type l); do
		fperms --reference="${S}/$f" /opt/${MY_PF}/$f
	done
	fperms -R a=u /opt/${MY_PF}
	fperms a=u /opt/${MY_PF}
}
