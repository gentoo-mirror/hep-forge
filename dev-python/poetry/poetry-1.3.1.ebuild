# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="A frontend for poetry - a python dependency management and packaging tool"
HOMEPAGE="https://python-poetry.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/poetry-core-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/poetry-plugin-export-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/cleo-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/crashtest-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.20.50[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.10.0[${PYTHON_USEDEP}]
	>=dev-python/keyring-23.9.0[${PYTHON_USEDEP}]
	>=dev-python/lockfile-0.12.2[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.5[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.10.1[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.11.6[${PYTHON_USEDEP}]
	>=dev-python/trove-classifiers-2022.5.19[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-20.4.7[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/cachecontrol-0.12.9[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/importlib_metadata-4.4.0[${PYTHON_USEDEP}]' python3_9)
"

DEPEND="
	test? (
			dev-python/pytest-mock[${PYTHON_USEDEP}]
			dev-python/httpretty[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	# Dependency on abandoned package cachy has been removed from poetry https://github.com/python-poetry/poetry/pull/5868
	# and remains in tests only for time being, so we can skip them.
	# removal of tests upstream https://github.com/python-poetry/poetry/pull/7437
	"${FILESDIR}"/${P}-remove_cachy_dependent_tests.patch
	# Dependency on flatdict is only due to tests and is planned for removal in poetry-1.4
	# https://github.com/python-poetry/poetry/pull/7369
	"${FILESDIR}"/${P}-skip_flatdict_dependent_tests.patch
)

EPYTEST_DESELECT=(
	# test require network (they run `pip install ...`)
	tests/installation/test_executor.py::test_executor_should_write_pep610_url_references_for_directories
	tests/installation/test_executor.py::test_executor_should_write_pep610_url_references_for_git
	tests/installation/test_executor.py::test_executor_should_write_pep610_url_references_for_git_with_subdirectories
	tests/installation/test_pip_installer.py::test_uninstall_git_package_nspkg_pth_cleanup
)

distutils_enable_tests pytest
