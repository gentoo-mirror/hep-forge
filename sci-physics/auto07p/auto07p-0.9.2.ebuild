# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 
DESCRIPTION="AUTO is a publicly available software for continuation and bifurcation problems in ordinary differential equations"
HOMEPAGE="https://github.com/auto-07p/auto-07p"
#SRC_URI="https://github.com/auto-07p/auto-07p/archive/master.zip"
SRC_URI=""
EGIT_REPO_URI="https://github.com/auto-07p/auto-07p.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-doc"
if [[ "${PV}" != "9999" ]] ; then
   REFS="refs/tags/v${PV}"
   TAG="v${PV}"
fi
#S="${WORKDIR}/auto-07p-master"

DEPEND="dev-python/matplotlib[tk]
		dev-lang/python[tk]
		dev-python/ipython
		x11-terms/xterm
		dev-python/numpy
		x11-libs/motif
"
# SoQt or SoXt + coin3d?
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-text/texlive dev-tex/latexmk )"
PATCHES=(
	"${FILESDIR}/01_auto.patch"
)

src_unpack() {
   git-r3_fetch ${EGIT_REPO_URI} ${REFS} ${TAG}
   git-r3_checkout ${EGIT_REPO_URI} ${WORKDIR}/${P} ${TAG}
}

src_configure() {
	./configure
}

src_compile() {
	make all
	make clean
	if use doc ; then
		cd doc
		latexmk -pdf -pvc- -interaction=nonstopmode auto.tex
		cd ..
	fi
}

src_install() {
	local NAME=auto-07p
	insinto /usr/lib/${NAME}
	doins -r .
	PFAD=/usr/lib/${NAME}
	for f in bin/*
	do
		local n=$(/usr/bin/basename $f)
		fperms +x $PFAD/$f
		dosym $PFAD/$f /usr/bin/${n}
	done

	for f in cmds/@*
	do
		local m=$(/usr/bin/basename $f)
		fperms +x $PFAD/$f
		dosym $PFAD/$f /usr/bin/${m}
	done
}

#pkg_postinst() {
#	ewarn "You need to set your path to include /opt/auto-07p/bin and /opt/auto-07p/cmds (eg. via .bashrc)"
#}

