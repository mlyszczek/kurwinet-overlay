# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools

DESCRIPTION="Logger written in C89 targeting embedded systems."
HOMEPAGE="http://embedlog.kurwinet.pl"
SRC_URI="http://distfiles.kurwinet.pl/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	default

	# package installs .pc files
	find "${D}" -name '*.la' -delete || die
}
