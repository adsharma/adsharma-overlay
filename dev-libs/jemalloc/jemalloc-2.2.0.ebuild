# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/jemalloc/jemalloc-2.1.0-r1.ebuild,v 1.1 2011/01/09 21:25:29 anarchy Exp $

EAPI="2"

inherit autotools eutils flag-o-matic git

DESCRIPTION="Jemalloc is a general-purpose scalable concurrent allocator"
HOMEPAGE="http://www.canonware.com/jemalloc/"
#SRC_URI="http://www.canonware.com/download/${PN}/${P}.tar.bz2"
EGIT_REPO_URI=git://canonware.com/jemalloc.git
EGIT_COMMIT=${PV}

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug profile stats"

DEPEND=""
RDEPEND=""

src_prepare() {
	cd jemalloc;
	epatch "${FILESDIR}/${PN}-strip-optimization.patch"

	eautoreconf
}

src_configure() {
	cd jemalloc;
	econf \
		$(use_enable debug) \
		$(use_enable profile prof) \
		$(use_enable stats) \
		|| die "configure failed"
}

src_install() {
	cd jemalloc;
	make DESTDIR="${D}" install

	# Rename pproff to prevent collision
	mv "${D}"/usr/bin/pprof "${D}"/usr/bin/jpprof
}
