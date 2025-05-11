# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{6..13} )
inherit distutils-r1

DESCRIPTION="Git credential helper for the password manager pass"
HOMEPAGE="https://github.com/jkwill87/mnamer"
SRC_URI="https://github.com/jkwill87/mnamer/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# fixes the "Make sure you're either building from a fully intact git repository or PyPI tarballs" error
export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/babelfish[${PYTHON_USEDEP}]
	dev-python/guessit[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-cache[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/teletype[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/gpep517[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}"/patches/
)
