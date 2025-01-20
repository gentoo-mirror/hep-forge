EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Standard Model UFO"
HOMEPAGE="
	https://github.com/APN-Pucky/ufo_sm
	https://pypi.org/project/ufo_sm/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	default
	# Don't use dynamic versioning
	sed -i "s/version.*=.*\"0\.0\.0\"/version = \"${PV}\"/" pyproject.toml 	|| die
	sed -i "s/requires.*=.*/requires = [\"poetry-core>=1.0.0\"]/" pyproject.toml 	|| die
	sed -i 's/poetry_dynamic_versioning.backend/poetry.core.masonry.api/g' pyproject.toml || die
}
