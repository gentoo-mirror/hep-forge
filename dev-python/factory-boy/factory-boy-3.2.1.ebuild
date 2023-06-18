# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="A test fixtures replacement for Python"
HOMEPAGE="
	https://github.com/FactoryBoy/factory_boy
	https://factoryboy.readthedocs.io/
"
MY_PN="factory_boy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="test? (
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/sqlalchemy[sqlite,${PYTHON_USEDEP}]
	dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
	dev-python/mongoengine[${PYTHON_USEDEP}]
	dev-python/pymongo[${PYTHON_USEDEP}]
)"

S="${WORKDIR}/${MY_PN}-${PV}"

distutils_enable_tests unittest

src_prepare() {
	rm tests/test_mongoengine.py || die
	distutils-r1_src_prepare
}
