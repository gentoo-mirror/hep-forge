# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )


MY_PV=$(ver_rs 1-3 '_')
MY_PN="MG5_aMC_v"
MY_PF=${MY_PN}${MY_PV}

DESCRIPTION="MadGraph5_aMC@NLO"
HOMEPAGE="https://launchpad.net/mg5amcnlo"
SRC_URI="https://launchpad.net/mg5amcnlo/3.0/3.3.x/+download/${MY_PN}${PV}.tar.gz"
S=${WORKDIR}/${MY_PF}

LICENSE="Open Source License"
SLOT="3"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE=""
REQUIRED_USE=""

RDEPEND="
	dev-lang/python
	sys-devel/gcc[fortran]
	acct-user/madgraph
	acct-group/madgraph
	"
PATCHES=( "${FILESDIR}"/cuttools.patch )
DEPEND="${RDEPEND}"
BDEPEND="
	acct-user/madgraph
	acct-group/madgraph
"

src_unpack() {
	tar xvzf "${DISTDIR}"/${MY_PN}${PV}.tar.gz -C ${WORKDIR}
}

src_install() {
	dodir /opt/${MY_PF}
	insinto /opt/
	doins -r "${S}"
	cd "${S}"
	for f in $(find * ! -type l); do
		fperms --reference="${S}/$f" /opt/${MY_PF}/$f
	done
	fperms -R g=u /opt/${MY_PF}

	#fperms +x /opt/${MY_PF}/bin/mg5_aMC
	fowners madgraph:madgraph -R /opt/${MY_PF}
	dosym /opt/${MY_PF}/bin/mg5_aMC /usr/bin/mg5_aMC3

	ewarn "YOU MUST add your user to the madgraph group"
	ewarn "eg. sudo usermod -a -G madgraph username"
	ewarn "Running sessions must be restarted"
}
