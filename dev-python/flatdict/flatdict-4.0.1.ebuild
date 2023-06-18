# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Python module for interacting with nested dicts"
HOMEPAGE="https://github.com/gmr/flatdict"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

distutils_enable_tests unittest
