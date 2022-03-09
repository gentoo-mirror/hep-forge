# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for MadGraph"
ACCT_USER_ID=703
ACCT_USER_GROUPS=( ${PN} )

acct-user_add_deps
