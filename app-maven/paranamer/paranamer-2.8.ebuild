# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/paranamer-2.8.pom --download-uri https://repo.maven.apache.org/maven2/com/thoughtworks/paranamer/paranamer/2.8/paranamer-2.8-sources.jar --slot 0 --keywords "~amd64" --ebuild paranamer-2.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Paranamer allows runtime access to constructor and method parameter names for Java classes"
HOMEPAGE="https://github.com/paul-hammant/paranamer/paranamer"
SRC_URI="https://repo.maven.apache.org/maven2/com/thoughtworks/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.thoughtworks.paranamer:paranamer:2.8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.inject:javax.inject:1 -> >=dev-java/javax-inject-1:0

CDEPEND="
	>=dev-java/javax-inject-1:0
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="javax-inject"
