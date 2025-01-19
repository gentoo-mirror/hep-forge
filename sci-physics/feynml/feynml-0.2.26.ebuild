EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Feynman diagram markup language."
HOMEPAGE="
    https://github.com/APN-Pucky/feynml
    https://pypi.org/project/feynml/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    sci-physics/particle[${PYTHON_USEDEP}]
	sci-physics/pyqgraf[${PYTHON_USEDEP}]
	sci-physics/pyhepmc[${PYTHON_USEDEP}]
	sci-physics/pylhe[${PYTHON_USEDEP}]
	dev-python/xsdata[cli,lxml,soap,${PYTHON_USEDEP}]
	dev-python/cssutils[${PYTHON_USEDEP}]
	dev-python/cssselect[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
	dev-python/deprecation[${PYTHON_USEDEP}]
	dev-python/smpl_io[${PYTHON_USEDEP}]
	dev-python/smpl_doc[${PYTHON_USEDEP}]
	dev-python/smpl_util[${PYTHON_USEDEP}]
"


src_prepare() {
    default
	# Don't use dynamic versioning 	
	sed -i "s/version.*=.*\"0\.0\.0\"/version = \"${PV}\"/" pyproject.toml 	|| die
	sed -i "s/requires.*=.*/requires = [\"poetry-core>=1.0.0\"]/" pyproject.toml 	|| die
	sed -i 's/poetry_dynamic_versioning.backend/poetry.core.masonry.api/g' pyproject.toml || die
}