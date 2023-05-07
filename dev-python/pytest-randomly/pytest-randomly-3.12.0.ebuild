# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Pytest plugin to randomly order tests and control random.seed"
HOMEPAGE="https://github.com/pytest-dev/pytest-randomly"
SRC_URI="https://github.com/pytest-dev/pytest-randomly/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="test? (
	dev-python/pytest-xdist[${PYTHON_USEDEP}]
	dev-python/factory-boy[${PYTHON_USEDEP}]
	dev-python/Faker[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/numpy[${PYTHON_USEDEP}]' python3_{9,10})
)"

RDEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/importlib_metadata-3.6.0[${PYTHON_USEDEP}]' python3_9)
"

distutils_enable_tests pytest

python_test() {
	# Be sure the tests are ran as specified in tox.ini before reporting any issues upstream.
	unset PYTHONDONTWRITEBYTECODE  # tests manipulate __pycache__
	local -x PYTHONDEVMODE=1
	epytest \
		-W error:ResourceWarning \
		-W error:DeprecationWarning \
		-W error:PendingDeprecationWarning \
		-p no:randomly
}
