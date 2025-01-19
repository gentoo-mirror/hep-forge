# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

REPO=tefra

DESCRIPTION="Library and command line tool for producing version strings."
HOMEPAGE="
	https://github.com/tefra/xsdata
	https://pypi.org/project/xsdata/
"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${REPO}/${PN}"
else
	inherit pypi
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="cli lxml soap"

RDEPEND="
	lxml? ( >=dev-python/lxml-4.5.0 )
	cli? (
		>=dev-python/click-5
		>=dev-python/click-default-group-1.2
		>=dev-python/docformatter-1.7.2
		>=dev-python/jinja2-2.10
		>=dev-python/toposort-1.5
	)
	soap? ( dev-python/requests )
"

#distutils_enable_tests pytest
