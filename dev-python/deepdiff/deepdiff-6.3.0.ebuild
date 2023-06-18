# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi 

DESCRIPTION="A library for comparing dictionaries, iterables, strings and other objects"
HOMEPAGE="https://github.com/seperman/deepdiff"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
"

DEPEND="test? (
	>=dev-python/jsonpickle-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.23.5[${PYTHON_USEDEP}]
)"

distutils_enable_tests pytest
