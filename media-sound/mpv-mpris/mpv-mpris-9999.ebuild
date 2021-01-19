# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="mpv-mpris is a plugin for mpv which allows control of the player using standard media keys"
HOMEPAGE="https://github.com/hoyon/mpv-mpris"
SRC_URI=""
EGIT_REPO_URI="https://github.com/hoyon/mpv-mpris.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#S="${WORKDIR}/${PN}-${PV}"

if [[ "${PV}" != "9999" ]] ; then
   REFS="refs/tags/${PV}"
   TAG="${PV}"
fi


DEPEND="media-video/mpv[cplugins,libmpv]
"
# gio
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
   git-r3_fetch ${EGIT_REPO_URI} ${REFS} ${TAG}
   git-r3_checkout ${EGIT_REPO_URI} ${WORKDIR}/${P} ${TAG}
}

src_install() {
	make
	insinto /etc/mpv/scirpts
	doins mpris.so
}
