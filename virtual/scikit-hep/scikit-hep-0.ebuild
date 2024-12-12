# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Metapackage of Scikit-HEP project data analysis packages for Particle Physics."
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/awkward
	dev-python/boost-histogram
	sci-physics/decaylanguage
	sci-physics/hepstats
	sci-physics/hepunits
	dev-python/hist
	dev-python/histoprint
	dev-python/iminuit
	dev-python/matplotlib
	dev-python/numpy
	sci-physics/particle
	sci-physics/pylhe
	dev-python/resample
	sci-physics/uproot
	dev-python/vector
"
