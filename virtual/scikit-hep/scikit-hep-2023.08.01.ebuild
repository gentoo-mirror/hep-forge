# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Metapackage of Scikit-HEP project data analysis packages for Particle Physics."
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/awkward-2.3.0 <dev-python/awkward-2.4
	>=dev-python/boost-histogram-1.3.0 <dev-python/boost-histogram-1.4
	>=sci-physics/decaylanguage-0.16.0 <sci-physics/decaylanguage-0.17
	>=sci-physics/hepstats-0.7.0 <sci-physics/hepstats-0.8
	>=sci-physics/hepunits-2.3.0 <sci-physics/hepunits-2.4
	>=dev-python/hist-2.7.0 <dev-python/hist-2.8
	>=dev-python/histoprint-2.4.0 <dev-python/histoprint-2.5
	>=dev-python/iminuit-2.23.0 <dev-python/iminuit-2.24
	>dev-python/matplotlib-3.4.0
	>dev-python/numpy-1.13.1
	>=sci-physics/particle-0.23.0 <sci-physics/particle-0.24
	>=sci-physics/pylhe-0.7.0 <sci-physics/pylhe-0.8
	>=dev-python/resample-1.6.0 <dev-python/resample-1.7
	>=sci-physics/uproot-5.0.0 <sci-physics/uproot-5.1
	>=dev-python/vector-1.1.0 <dev-python/vector-1.2
"
