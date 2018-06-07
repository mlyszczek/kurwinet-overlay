# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools user

DESCRIPTION="Simple static site generator from directory tree"
HOMEPAGE="http://kursg.kurwinet.pl"
SRC_URI="http://distfiles.kurwinet.pl/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-shells/bash"

src_install() {
	emake install DESTDIR="${D}/usr" || die
}
