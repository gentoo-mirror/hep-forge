EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/APN-Pucky/feynml"
else
	inherit pypi
	KEYWORDS="~amd64"
fi

DESCRIPTION="Feynman diagram markup language."
HOMEPAGE="
	https://github.com/APN-Pucky/feynml
	https://pypi.org/project/feynml/
"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	sci-physics/particle[${PYTHON_USEDEP}]
	sci-physics/pyqgraf[${PYTHON_USEDEP}]
	sci-physics/pyhepmc[${PYTHON_USEDEP}]
	sci-physics/pylhe[${PYTHON_USEDEP}]
	>=dev-python/xsdata-24.9[cli,lxml,soap,${PYTHON_USEDEP}]
	dev-python/cssutils[${PYTHON_USEDEP}]
	dev-python/cssselect[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
	dev-python/deprecation[${PYTHON_USEDEP}]
	dev-python/smpl_io[${PYTHON_USEDEP}]
	dev-python/smpl_doc[${PYTHON_USEDEP}]
	dev-python/smpl_util[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		sci-physics/feynmodel[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest