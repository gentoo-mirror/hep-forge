EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

SUB_P=$(ver_cut 1)

DESCRIPTION="EasyBuild is a software build and installation framework."
HOMEPAGE="https://easybuild.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sys-cluster/easybuild-framework-${SUB_P}
"
BDEPEND="${RDEPEND}"

src_prepare() {
	# already there from easybuild_framework
	rm easybuild/__init__.py
	default
}
