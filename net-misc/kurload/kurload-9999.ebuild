# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools user git-r3

DESCRIPTION="Server to share files from command line with netcat."
HOMEPAGE="http://kurload.kurwinet.pl"
SRC_URI=""
EGIT_REPO_URI="https://git.kurwinet.pl/kurload"
EGIT_BRANCH="master"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE="ssl"

DEPEND="
	>=dev-libs/embedlog-0.5.0
	ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable ssl openssl)
}

pkg_preinst() {
	enewuser "${PN}"
}

src_install() {
	default
	newinitd "${FILESDIR}"/kurload-${PV}.rc6 kurload
	newconfd "${FILESDIR}"/kurload-${PV}.confd kurload
}
