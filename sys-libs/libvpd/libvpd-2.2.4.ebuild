# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils udev

DESCRIPTION="Library implementation for listing vpds"
HOMEPAGE="https://sourceforge.net/projects/linux-diag/"
SRC_URI="https://sourceforge.net/projects/linux-diag/files/libvpd/${PV}/libvpd-${PV}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~ppc ~ppc64"
IUSE="static-libs"

DEPEND="
	>=dev-db/sqlite-3.7.8
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_configure() {
	# sysconfdir is used only to establish where the udev rules file should go
	# unfortunately it also adds the subdirs on its own so we strip it down to
	# dirname
	econf \
		$(use_enable static-libs static) \
		--sysconfdir="$( dirname $(get_udevdir) )"
}

src_install(){
	emake DESTDIR="${D}" install
	prune_libtool_files

}
