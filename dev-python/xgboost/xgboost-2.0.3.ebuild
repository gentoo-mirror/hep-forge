# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
# We use a git module here since bumping would also need to be done manually for the submodules otherwise
EGIT_COMMIT="v${PV}"
EGIT_REPO_URI="https://github.com/dmlc/xgboost/"
inherit python-single-r1 cmake git-r3


DESCRIPTION="XGBoost Python Package"
HOMEPAGE="
	https://xgboost.readthedocs.io
	https://github.com/dmlc/xgboost/
"

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
