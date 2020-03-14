# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} pypy3 )

inherit distutils-r1

DESCRIPTION="Functional testing framework for command line applications"
HOMEPAGE="https://bitheap.org/cram/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~hppa ~mips ~ppc ~ppc64 x86 ~amd64-fbsd ~x86-fbsd"

python_test() {
	distutils_install_for_testing
	"${EPYTHON}" "${TEST_DIR}"/scripts/cram tests || die "Tests fail with ${EPYTHON}"
}