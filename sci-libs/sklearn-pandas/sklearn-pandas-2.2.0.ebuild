EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Pandas integration with sklearn"
HOMEPAGE="https://github.com/scikit-learn-contrib/sklearn-pandas"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    >=sci-libs/scikit-learn-0.23.0[${PYTHON_USEDEP}]
    >=dev-python/scipy-1.5.1[${PYTHON_USEDEP}]
    >=dev-python/pandas-1.1.4[${PYTHON_USEDEP}]
    >=dev-python/numpy-1.18.1[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
