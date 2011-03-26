# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

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

src_compile() {
	emake -j PREFIX=/usr DBG="-ggdb -Wall" || die
}

src_install() {
	emake install DESTDIR="${D}" PREFIX=/usr || die
	dodoc README
}
