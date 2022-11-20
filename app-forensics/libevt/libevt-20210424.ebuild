# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
inherit autotools python-single-r1

DESCRIPTION="Library and tools to access the Windows Event Log (EVT) format"
HOMEPAGE="https://github.com/libyal/libevt"
SRC_URI="https://github.com/libyal/libevt/releases/download/${PV}/${PN}-alpha-${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="nls unicode python +threads debug"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

DEPEND="
	nls? (
		virtual/libiconv
		virtual/libintl
	)
	python? ( dev-lang/python:* )
	app-forensics/libbfio[nls=,unicode=,threads=]
	dev-libs/libcdata[nls=]
	dev-libs/libcdirectory[nls=,unicode=]
	dev-libs/libcerror[nls=]
	dev-libs/libcfile[nls=,unicode=]
	dev-libs/libclocale[nls=,unicode=]
	dev-libs/libcnotify[nls=]
	dev-libs/libcpath[nls=,unicode=]
	dev-libs/libcsplit[nls=,unicode=]
	dev-libs/libcthreads[nls=]
	app-forensics/libexe[nls=,unicode=,threads=,python=]
	dev-libs/libfcache[nls=]
	dev-libs/libfdata[nls=,threads=]
	dev-libs/libfdatetime[nls=]
	dev-libs/libfguid[nls=]
	dev-libs/libfvalue[nls=]
	dev-libs/libfwevt[nls=,threads=,python=]
	dev-libs/libfwnt[nls=,threads=,python=]
	app-forensics/libregf[nls=,unicode=,threads=,python=]
	dev-libs/libuna[nls=,unicode=]
	dev-libs/libwrc[nls=,unicode=,threads=,python=]
"
RDEPEND="
	${DEPEND}
	python? ( ${PYTHON_DEPS} )
"

src_prepare() {
	eautoreconf
	eapply_user
}

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_with nls libiconv-prefix) \
		$(use_with nls libintl-prefix) \
		$(use_enable unicode wide-character-type) \
		$(use_enable debug verbose-output ) \
		$(use_enable debug debug-output ) \
		$(use_enable threads multi-threading-support) \
		$(use_enable python) \
		$(use_enable python python3) \

}
