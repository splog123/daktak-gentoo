# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit webapp depend.php git-2

DESCRIPTION="self hostable application for saving web pages"
HOMEPAGE="https://www.wallabag.org"
EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
SRC_URI="http://static.wallabag.org/files/vendor.zip"

LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/php:*[tidy,xmlreader,filter,iconv,curl]"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
	unpack ${A}
	mv vendor "${P}"
}

src_install() {
	webapp_src_preinst

	dodoc CONTRIBUTING.md COPYING.md CREDITS.md TRANSLATION.md
	rm -f README.md CONTRIBUTING.md COPYING.md CREDITS.md TRANSLATION.md

	last_commit=$(git rev-parse HEAD)
	echo "${last_commit}" > version.txt

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_src_install
}

pkg_postinst() {
	elog "Edit /usr/share/webapps/${PN}/${PV}/htdocs/intranet/serverconfig.php"
	elog "Don't forget run "
	elog " webapp-config -I -h localhost -d ${PN} ${PN} ${PV}"
}
