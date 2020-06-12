# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hpack-1.0.2.pom --download-uri https://repo.maven.apache.org/maven2/com/twitter/hpack/1.0.2/hpack-1.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild hpack-1.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Header Compression for HTTP/2"
HOMEPAGE="http://github.com/twitter/hpack/hpack"
SRC_URI="https://repo.maven.apache.org/maven2/com/twitter/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.twitter:hpack:1.0.2"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

