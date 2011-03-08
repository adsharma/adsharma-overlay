# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/libunwind/libunwind-0.99.ebuild,v 1.4 2009/11/24 19:10:14 armin76 Exp $

inherit git

DESCRIPTION="Library to translate CPU vendor specified hw events to OS specific format"
HOMEPAGE="http://perfmon2.sf.net/"
#SRC_URI="http://perfmon2.sf.net/tmp/${P}.tar.gz"
EGIT_REPO_URI=git://perfmon2.git.sourceforge.net/gitroot/perfmon2/libpfm4
RESTRICT=fetch

LICENSE="MIT"
SLOT="7"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="test"

#src_unpack() {
#	unpack ${A}
#	cd "${S}"
#}

src_compile() {
	emake -j PREFIX=/usr DBG="-ggdb -Wall" || die
}

src_install() {
	emake install DESTDIR="${D}" PREFIX=/usr || die
	dodoc README
}
