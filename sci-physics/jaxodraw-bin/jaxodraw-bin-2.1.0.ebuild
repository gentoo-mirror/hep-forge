# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 desktop

MY_PN="jaxodraw"
MY_PV=$(ver_rs 2 '-')
MY_P=${MY_PN}-${MY_PV}

DESCRIPTION="Java program for drawing Feynman diagrams"
HOMEPAGE="
	https://jaxodraw.sourceforge.io/index.html
	http://jaxodraw.sourceforge.net/
"
SRC_URI="
	https://${MY_PN}.sourceforge.net/download/pkgs/${MY_P}-bin.tar.gz
	https://${MY_PN}.sourceforge.net/download/pkgs/${MY_P}-src.tar.gz
	latex? ( https://downloads.sourceforge.net/${MY_PN}/axodraw4j_2008_11_19.tar.gz )
"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+latex"

DEPEND="
	>=virtual/jdk-1.6
	latex? ( dev-texlive/texlive-pstricks:0 )
"

RDEPEND=">=virtual/jre-1.6"


src_install() {
	java-pkg_newjar ${MY_P}.jar

	newicon src/site/resources/images/favicon.ico jaxodraw.ico
	make_desktop_entry jaxodraw JaxoDraw jaxodraw.ico

	use source && java-pkg_dosrc src/main/java/net

	dodoc src/doc/BUGS src/doc/CHANGELOG src/doc/README src/doc/TODO
	use doc && java-pkg_dojavadoc build/javadoc

	java-pkg_dolauncher "${MY_P}"

	if use latex; then
		insinto /usr/share/texmf-dist/tex/latex/misc/
		doins "${S}/../axodraw4j.sty"
	fi
}

tex_regen() {
	if use latex; then
		einfo "Regenerating TeX database..."
		ebegin
		/usr/bin/mktexlsr /usr/share/texmf-dist /var/spool/texmf > /dev/null
		eend $?
	fi
}

pkg_postinst() {
	tex_regen
}

pkg_postrm() {
	tex_regen
}
