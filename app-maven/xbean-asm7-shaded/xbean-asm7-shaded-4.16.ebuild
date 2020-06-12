# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xbean-asm7-shaded-4.16.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/xbean/xbean-asm7-shaded/4.16/xbean-asm7-shaded-4.16-sources.jar --slot 0 --keywords "~amd64" --ebuild xbean-asm7-shaded-4.16.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Repackaged and shaded asm jars"
HOMEPAGE="http://geronimo.apache.org/maven/xbean/4.16/xbean-asm7-shaded"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/xbean/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.xbean:xbean-asm7-shaded:4.16"



DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

