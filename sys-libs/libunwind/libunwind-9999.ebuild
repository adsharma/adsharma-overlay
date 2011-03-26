# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/libunwind/libunwind-0.99.ebuild,v 1.4 2009/11/24 19:10:14 armin76 Exp $

EAPI="2"
inherit autotools git

DESCRIPTION="Portable and efficient API to determine the call-chain of a program"
HOMEPAGE="http://savannah.nongnu.org/projects/libunwind"
EGIT_REPO_URI=git://git.sv.gnu.org/libunwind.git

LICENSE="MIT"
SLOT="7"
KEYWORDS="amd64 ia64 x86"
IUSE=""

DEPEND="dev-libs/libatomic_ops"
RDEPEND=""

RESTRICT="test"		 # https://savannah.nongnu.org/bugs/?22368
					 # https://bugs.gentoo.org/273372

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --disable-block-signals --disable-conservative-checks || die
}

src_compile() {
	emake -j CFLAGS="-D__USE_FORTIFY_LEVEL=0"
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc AUTHORS ChangeLog NEWS README TODO
}
