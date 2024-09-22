# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9,10} )

inherit python-single-r1 scons-utils

MY_P=OpenLoops-${PV}

DESCRIPTION="Evaluation of tree and one-loop matrix elements for any Standard Model."
HOMEPAGE="https://openloops.hepforge.org/index.html"
SRC_URI="https://openloops.hepforge.org/downloads?f=${MY_P}.tar.gz -> ${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

# TODO use managed cuttools,qcdloop,oneloop
DEPEND="
	sci-physics/collier
	sci-physics/qcdloop
	sci-physics/oneloop[dpkind,qpkind16,-qpkind,-cppintf]
	sci-physics/cuttools
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	mv openloops.cfg.tmpl openloops.cfg
	if use extra ; then
		sed -i "s|#compile_extra.*|compile_extra = 1|" openloops.cfg || die
	fi
	echo "link_libraries = $(usev collier) $(usev cuttools)" >> openloops.cfg || die
	sed -i 's/#compile_libraries.*/compile_libraries = rambo trred/' openloops.cfg || die
	sed -i "s|scons -Q|scons -Q -C /opt/${MY_P}/|g" openloops || die

	echo "ccflags = ${CFLAGS}" >> openloops.cfg || die
	echo "cxxflags = ${CXXFLAGS}" >> openloops.cfg || die
	echo "f_flags = ${FFLAGS} -I${ESYSROOT}/usr/include/ -I${ESYSROOT}/usr/include/cuttools -lcollier" >> openloops.cfg || die
	echo "link_flags = ${LDFLAGS} -I${ESYSROOT}/usr/include/ -I${ESYSROOT}/usr/include/cuttools -lcollier" >> openloops.cfg || die

	echo "cc = $(tc-getCC)" >> openloops.cfg || die
	echo "cxx = $(tc-getCXX)" >> openloops.cfg || die
	echo "fortran_compiler = $(tc-getFC)" >> openloops.cfg || die

	echo "process_src_dir = /opt/${MY_P}/process_src/" >> openloops.cfg || die
	echo "process_obj_dir = /opt/${MY_P}/process_obj/" >> openloops.cfg || die
	echo "process_lib_dir = /opt/${MY_P}/proclib/" >> openloops.cfg || die
	echo "release = $PV" >> openloops.cfg || die
	echo "import_env = @all" >> openloops.cfg || die
	# fix rename for py3.12
	sed -i 's/SafeConfigParser/ConfigParser/g' pyol/tools/OLBaseConfig.py || die
	# wipe local scons
	rm -r scons-local || die
	rm scons || die
}

src_compile() {
	escons
}

src_install() {
	dobin openloops
	cd include
	doheader openloops.h
	cd ../lib || die
	# Also install so.version links
	dolib.so libolcommon.so* libopenloops.so* librambo.so* libtrred.so*
	cd ../lib_src/olcommon/mod || die
	doheader *.mod
	cd ../../openloops/mod
	doheader *.mod
	cd ../../rambo/mod
	doheader *.mod
	cd ../../trred/mod
	doheader *.mod

	cd "${S}"
	dodir /opt/${MY_P}
	insinto /opt/${MY_P}
	doins openloops.cfg SConstruct
	doins -r pyol
}

pkg_postinst() {
	elog "Install processes with ./openloops libinstall."
	elog "They are installed in /opt/${MY_P}/proclib."
}

