# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit python-single-r1 cmake

DESCRIPTION="XGBoost Python Package"
HOMEPAGE="
	https://xgboost.readthedocs.io
	https://github.com/dmlc/xgboost/
"
SRC_URI="https://github.com/dmlc/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	')
	${PYTHON_DEPS}
"
