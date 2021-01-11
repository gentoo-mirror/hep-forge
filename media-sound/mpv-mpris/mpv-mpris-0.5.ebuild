# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/hoyon/${PN}/archive/${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${PN}-${PV}"

DEPEND="media-video/mpv[cplugins,libmpv]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	make 
	insinto /etc/mpv/scirpts
	doins mpris.so
}
