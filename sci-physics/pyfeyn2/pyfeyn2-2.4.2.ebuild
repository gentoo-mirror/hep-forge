EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Feynman diagrams in Python."
HOMEPAGE="
    https://github.com/APN-Pucky/pyfeyn2
    https://pypi.org/project/pyfeyn2/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    sci-physics/particle[${PYTHON_USEDEP}]
	sci-physics/feynml[${PYTHON_USEDEP}]
	sci-physics/feynman[${PYTHON_USEDEP}]
	dev-python/xsdata[${PYTHON_USEDEP}]
	dev-python/pylatex[${PYTHON_USEDEP}]
	dev-tex/dot2tex[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/wand[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pyx[${PYTHON_USEDEP}]
	dev-python/pydot[${PYTHON_USEDEP}]
	dev-python/cssutils[${PYTHON_USEDEP}]
	dev-python/pylatexenc[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/graphviz[${PYTHON_USEDEP}]
	dev-python/ipyparallel[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
	dev-python/deprecation[${PYTHON_USEDEP}]
	dev-python/cssselect[${PYTHON_USEDEP}]
	dev-python/iminuit[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/asciidraw[${PYTHON_USEDEP}]
	dev-python/smpl_io[${PYTHON_USEDEP}]
	dev-python/smpl_doc[${PYTHON_USEDEP}]
	dev-python/smpl_util[${PYTHON_USEDEP}]
    dev-tex/latexmk
    app-text/ghostscript-gpl
"

src_prepare() {
    default
	# Don't use dynamic versioning 	
	sed -i "s/version.*=.*\"0\.0\.0\"/version = \"${PV}\"/" pyproject.toml 	|| die
	sed -i "s/requires.*=.*/requires = [\"poetry-core>=1.0.0\"]/" pyproject.toml 	|| die
	sed -i 's/poetry_dynamic_versioning.backend/poetry.core.masonry.api/g' pyproject.toml || die
}