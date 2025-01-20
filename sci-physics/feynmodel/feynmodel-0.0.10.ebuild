EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Models for constructing Feynman diagrams."
HOMEPAGE="
	https://github.com/APN-Pucky/feynmodel
	https://pypi.org/project/feynmodel/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-physics/ufo_sm[${PYTHON_USEDEP}]
	sci-physics/ufo_mssm[${PYTHON_USEDEP}]
	sci-physics/particle[${PYTHON_USEDEP}]
	dev-python/xsdata[cli,lxml,soap,${PYTHON_USEDEP}]
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
