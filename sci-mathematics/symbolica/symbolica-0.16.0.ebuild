# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.5

EAPI=8

CRATES="
	addr2line@0.24.1
	adler2@2.0.0
	ahash@0.8.11
	aho-corasick@1.1.3
	alloc-no-stdlib@2.0.4
	alloc-stdlib@0.2.2
	append-only-vec@0.1.6
	autocfg@1.4.0
	az@1.2.1
	backtrace@0.3.74
	bincode@2.0.1
	bincode_derive@2.0.1
	brotli-decompressor@4.0.1
	brotli@5.0.0
	bytemuck@1.18.0
	byteorder@1.5.0
	bytes@1.7.2
	cc@1.1.24
	cfg-if@1.0.0
	colored@2.1.0
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.20
	ctor@0.1.26
	dyn-clone@1.0.17
	either@1.13.0
	env_logger@0.10.2
	getrandom@0.2.15
	ghost@0.1.17
	gimli@0.31.0
	gmp-mpfr-sys@1.6.4
	heck@0.5.0
	hermit-abi@0.4.0
	humantime@2.1.0
	indoc@2.0.5
	inventory@0.2.3
	is-terminal@0.4.13
	lazy_static@1.5.0
	libc@0.2.159
	libloading@0.8.5
	libm@0.2.8
	link-cplusplus@1.0.9
	log@0.4.22
	matchers@0.1.0
	memchr@2.7.4
	memoffset@0.9.1
	miniz_oxide@0.8.0
	nu-ansi-term@0.46.0
	num-traits@0.2.19
	object@0.36.4
	once_cell@1.20.1
	ordered-float@3.9.2
	overload@0.1.1
	pin-project-lite@0.2.14
	portable-atomic@1.9.0
	ppv-lite86@0.2.20
	proc-macro2@1.0.86
	process_path@0.1.4
	pyo3-build-config@0.23.3
	pyo3-ffi@0.23.3
	pyo3-macros-backend@0.23.3
	pyo3-macros@0.23.3
	pyo3@0.23.3
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_xoshiro@0.6.0
	rayon-core@1.12.1
	rayon@1.10.0
	ref-cast-impl@1.0.23
	ref-cast@1.0.23
	regex-automata@0.1.10
	regex-automata@0.4.8
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.0
	rug@1.25.0
	rustc-demangle@0.1.24
	safe_arch@0.7.2
	self_cell@1.0.4
	serde@1.0.210
	serde_derive@1.0.210
	sharded-slab@0.1.7
	shlex@1.3.0
	smallvec@1.13.2
	smartstring@1.0.1
	static_assertions@1.1.0
	symbolica@0.16.0
	syn@1.0.109
	syn@2.0.79
	target-lexicon@0.12.16
	termcolor@1.4.1
	thread_local@1.1.8
	tikv-jemalloc-sys@0.5.4+5.3.0-patched
	tikv-jemallocator@0.5.4
	tinyjson@2.5.1
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing@0.1.40
	unicode-ident@1.0.13
	unindent@0.2.3
	unty@0.0.4
	valuable@0.1.0
	version_check@0.9.5
	virtue@0.0.18
	wasi@0.11.0+wasi-snapshot-preview1
	wide@0.7.28
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.32.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.32.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.32.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.32.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.32.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.32.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	wolfram-app-discovery@0.4.8
	wolfram-expr@0.1.4
	wolfram-library-link-macros@0.2.10
	wolfram-library-link-sys@0.2.10
	wolfram-library-link@0.2.10
	wstp-sys@0.2.8
	wstp@0.2.9
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
"

inherit cargo

DESCRIPTION="A blazing fast computer algebra system"
HOMEPAGE=""
SRC_URI="
	${CARGO_CRATE_URIS}
"

LICENSE="all-rights-reserved"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD ISC LGPL-3+ MIT
	MPL-2.0 MPL-2.0 Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror"
