# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator
#inherit distutils

DESCRIPTION="Tool to query CPU performance counters and more"
HOMEPAGE="https://perf.wiki.kernel.org/index.php/Perf_examples"

MY_PV="rc1"
SRC_URI="file:///tmp/${PN}/${PN}-${PV}-${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
#DEPEND="sys-libs/libpfm4 dev-libs/elfutils"
DEPEND="dev-libs/elfutils"
#DISTUTILS_SETUP_FILES="util/setup.py"

S="${WORKDIR}/${P}-${MY_PV}/tools/perf"

src_compile() {
	cd ${S}
	emake -j DESTDIR="${D}" V=1 prefix=/usr EXTRA_CFLAGS="-Wno-error" || die
	#distutils_src_compile
}

src_install() {
	cd ${S}
	emake -j install DESTDIR="${D}" V=1 prefix=/usr EXTRA_CFLAGS="-Wno-error" || die
	#distutils_src_install
	dodoc Documentation
}
