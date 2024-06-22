# Copyright 2024 Ivan Boikov
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{7..12} )
inherit distutils-r1

DESCRIPTION="High-level cross-platform tty library"
HOMEPAGE="https://github.com/jkwill87/teletype"
SRC_URI="https://github.com/jkwill87/teletype/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
