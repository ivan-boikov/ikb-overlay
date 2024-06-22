# Copyright 2024 Ivan Boikov
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{6..12} )
inherit distutils-r1

DESCRIPTION="Git credential helper for the password manager pass"
HOMEPAGE="https://github.com/jkwill87/mnamer"
SRC_URI="https://github.com/jkwill87/mnamer/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# fixes the "Make sure you're either building from a fully intact git repository or PyPI tarballs" error
export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

# from requirements.txt as of c132693be72a17a3caa5ad56baf7b6001ab83335
# appdirs ~= 1.4.4
# babelfish ~= 0.6.0
# guessit ~= 3.7.1
# requests == 2.*
# requests_cache ~= 0.9.7
# setuptools_scm ~= 7.1.0
# teletype ~= 1.3.4
# typing-extensions ~= 4.7.1

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/babelfish[${PYTHON_USEDEP}]
	dev-python/guessit[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-cache[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/teletype[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
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
