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
IUSE="doc examples"
REQUIRED_USE=""

RDEPEND="
	dev-lang/python
	virtual/gfortran
	acct-user/madgraph
	acct-group/madgraph
	"
DEPEND="${RDEPEND}"
BDEPEND="
	acct-user/madgraph
	acct-group/madgraph
"

src_install() {
	dodir /opt/${MY_PF}
	insinto /opt/
	doins -r ${S}
	fowners madgraph:madgraph -R /opt/${MY_PF}
}
