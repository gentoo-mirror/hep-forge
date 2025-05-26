EAPI=8

PYTHON_COMPAT=( python3_{9..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Lightweight renderer of LaTeX to a variety of graphics formats"
HOMEPAGE="https://pypi.org/project/tex2pix/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
