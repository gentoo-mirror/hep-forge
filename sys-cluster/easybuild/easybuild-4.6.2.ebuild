EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="EasyBuild is a software build and installation framework."
HOMEPAGE="https://easybuild.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/openssl
	sys-cluster/lmod
	=sys-cluster/easybuild-framework-${PV}
	=sys-cluster/easybuild-easyblocks-${PV}
	=sys-cluster/easybuild-easyconfigs-${PV}
"
BDEPEND="${RDEPEND}"
