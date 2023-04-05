EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python library for converting Scikit-Learn pipelines to PMML"
HOMEPAGE="https://github.com/jpmml/sklearn2pmml"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=virtual/jdk-1.8:*
	>=dev-python/joblib-0.13.0[${PYTHON_USEDEP}]
	>=sci-libs/scikit-learn-0.18.0[${PYTHON_USEDEP}]
	>=sci-libs/sklearn-pandas-0.0.10[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
