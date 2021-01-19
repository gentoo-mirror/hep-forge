# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/eonpatapon/${PN}/archive/${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${PN}-${PV}"

DEPEND="media-sound/mpd
sys-apps/dbus
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_config() {
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
