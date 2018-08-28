# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Local Linux enumeration and privilege escalation checker."
HOMEPAGE="https://github.com/rebootuser/LinEnum"
COMMIT="d42e5eb07c4559ec2162f09ec71d687bf218a8a8"
MY_P="LinEnum-${COMMIT}"
SRC_URI="https://github.com/rebootuser/LinEnum/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_install() {
	dobin LinEnum.sh
	dosym LinEnum.sh /usr/bin/linenum
}

