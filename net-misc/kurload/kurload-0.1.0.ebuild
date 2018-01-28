# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools user

DESCRIPTION="Server to share files from command line with netcat."
HOMEPAGE="http://kurload.kurwinet.pl"
SRC_URI="http://distfiles.kurwinet.pl/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/embedlog"
RDEPEND="${DEPEND}"

pkg_preinst() {
	enewuser "${PN}"
}

src_install() {
	newinitd "${FILESDIR}"/kurload.rc6 kurload
	newconfd "${FILESDIR}"/kurload.confd kurload
}
