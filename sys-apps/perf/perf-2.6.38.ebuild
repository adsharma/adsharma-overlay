# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator
inherit distutils

MY_PV=2.6.38rc3
MY_S=${WORKDIR}/${PN}-${MY_PV}
DESCRIPTION="Tool to query CPU performance counters and more"
HOMEPAGE="https://perf.wiki.kernel.org/index.php/Perf_examples"
SRC_URI="file:///tmp/${PN}/${PN}-${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND="sys-libs/libpfm4 dev-libs/elfutils"
DISTUTILS_SETUP_FILES="util/setup.py"

src_compile() {
	cd "${MY_S}/tools/perf"
	emake -j DESTDIR="${D}" prefix=/usr || die
	distutils_src_compile
}

src_install() {
	cd "${MY_S}/tools/perf"
	emake -j install DESTDIR="${D}" prefix=/usr || die
	distutils_src_install
	dodoc Documentation
}
