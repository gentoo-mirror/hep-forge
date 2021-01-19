# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="mpDris2 provide MPRIS 2 support to mpd"
HOMEPAGE="https://github.com/eonpatapon/mpDris2"
SRC_URI=""
#SRC_URI="https://github.com/eonpatapon/${PN}/archive/${PV}.zip"
EGIT_REPO_URI="https://github.com/eonpatapon/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#S="${WORKDIR}/${PN}-${PV}"

DEPEND="media-sound/mpd
		sys-apps/dbus
"
RDEPEND="${DEPEND}"
BDEPEND=""

if [[ "${PV}" != "9999" ]] ; then
   REFS="refs/tags/${PV}"
   TAG="${PV}"
fi

src_unpack() {
	git-r3_fetch ${EGIT_REPO_URI} ${REFS} ${TAG}
	git-r3_checkout ${EGIT_REPO_URI} ${WORKDIR}/${P} ${TAG}
}

src_configure() {
	./autogen.sh --sysconfdir=/etc
}

src_install() {
	newbin src/mpDris2.in.py mpDris2

	insinto /usr/local/share/dbus-1/services/
	newins src/org.mpris.MediaPlayer2.mpd.service.in org.mpris.MediaPlayer2.mpd.service

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/${PN}-0.8.logrotate ${PN}

	newinitd "${FILESDIR}"/${PN}-0.8.init ${PN}
}
