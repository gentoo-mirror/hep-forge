# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Metapackage of Scikit-HEP project data analysis packages for Particle Physics."
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-physics/awkward
	sci-physics/boost-histogram
	sci-physics/decaylanguage
	sci-physics/hepstats
	sci-physics/hepunits
	sci-physics/hist
	sci-physics/histoprint
    dev-python/iminuit
    dev-python/matplotlib
	dev-python/numpy
	sci-physics/particle
	sci-physics/pylhe
	sci-physics/resample
	sci-physics/uproot
	sci-physics/vector
"
