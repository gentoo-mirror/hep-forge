# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="A Python Object-Document-Mapper for working with MongoDB"
HOMEPAGE="
	https://github.com/MongoEngine/mongoengine
	http://mongoengine.org/
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-db/mongodb
	dev-python/pymongo[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest