# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Ebuild generated by g-pypi 0.3

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Video metadata parser"
HOMEPAGE="https://github.com/Diaoul/enzyme"
SRC_URI="http://pypi.python.org/packages/source/e/enzyme/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="test"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/setuptools
	test? ( dev-python/requests )"

python_test() {
	"${PYTHON}" setup.py test || die
}
