EAPI=8

PYTHON_COMPAT=( python3_{8..9} )
inherit distutils-r1

DESCRIPTION="EasyBuild is a software build and installation framework."
HOMEPAGE="https://easybuild.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+lmod modules"
REQUIRED_USE=" ^^ ( lmod modules ) "

RDEPEND="
	dev-libs/openssl
	dev-tcltk/tclx
	lmod? ( >=sys-cluster/lmod-6.5.1 )
	modules? ( >=sys-cluster/modules-3.2.10 )
	~sys-cluster/easybuild-framework-${PV}[${PYTHON_USEDEP}]
	~sys-cluster/easybuild-easyblocks-${PV}[${PYTHON_USEDEP}]
	~sys-cluster/easybuild-easyconfigs-${PV}[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
