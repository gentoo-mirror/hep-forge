
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
PYTHON_COMPAT=( python3_11 )
DISTUTILS_USE_PEP517=standalone
DISTUTILS_SINGLE_IMPL=1
inherit fortran-2 distutils-r1 git-r3

DESCRIPTION="An Automated One-Loop Matrix Element Generator"
HOMEPAGE="
	https://github.com/gudrunhe/gosam
	https://gosam.hepforge.org/
"

#SRC_URI="https://github.com/gudrunhe/gosam/releases/download/2.1.1/gosam-2.1.1-4b98559.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/gudrunhe/gosam"
if [[ ${PV} != 9999 ]]; then
    EGIT_COMMIT="${PV}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	>=sci-mathematics/form-4.0.0
	sci-physics/qgraf
	sci-physics/ninja
	sci-physics/samurai
	sci-physics/golem95
	sci-physics/qcdloop
	sci-physics/oneloop
	sci-physics/ff
"
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile() {
#    emake FFLAGS="-std=legacy ${FFLAGS}"
	:
}

src_install() {
	"${EPYTHON}" setup.py install --prefix="${D}/usr"
	# fix install dir
	sed -i -e "s#DATA_DIR\s*=.*#DATA_DIR = '${EPREFIX}/usr/share/golem'#g" "${D}/usr/lib/python3.11/site-packages/golem/installation.py"
}
