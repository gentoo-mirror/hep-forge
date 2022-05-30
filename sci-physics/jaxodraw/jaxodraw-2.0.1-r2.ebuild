# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_PV="2.0-1"

DESCRIPTION="Java program for drawing Feynman diagrams"
HOMEPAGE="http://jaxodraw.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${MY_PV}_src.tar.gz
	http://downloads.sourceforge.net/jaxodraw/axodraw4j_2008_11_19.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="latex"

DEPEND=">=virtual/jdk-1.6
	latex? ( dev-texlive/texlive-pstricks:0 )"

RDEPEND=">=virtual/jre-1.6"

S="${WORKDIR}/JaxoDraw-${MY_PV}"

PATCHES=( "${FILESDIR}"/jversion.patch )

src_install() {
	java-pkg_newjar build/${PN}-${MY_PV}.jar ${PN}.jar

	newicon src/site/xdocs/images/favicon.ico jaxodraw.ico
	make_desktop_entry jaxodraw JaxoDraw jaxodraw.ico

	use source && java-pkg_dosrc src/main/java/net

	dodoc src/doc/BUGS src/doc/CHANGELOG src/doc/README src/doc/TODO
	use doc && java-pkg_dojavadoc build/javadoc

	java-pkg_dolauncher "${PN}"

	if use latex; then
		dodir /usr/share/texmf-dist/tex/latex/misc/
		insinto /usr/share/texmf-dist/tex/latex/misc/
		doins "${S}/../axodraw4j.sty"
	fi
}

tex_regen() {
	if use latex; then
		einfo "Regenerating TeX database..."
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
