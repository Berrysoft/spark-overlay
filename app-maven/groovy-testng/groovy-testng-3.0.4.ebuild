# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/groovy-testng-3.0.4.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/groovy/groovy-testng/3.0.4/groovy-testng-3.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild groovy-testng-3.0.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.groovy:groovy-testng:3.0.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.groovy:groovy:3.0.4 -> >=app-maven/groovy-3.0.4:0

CDEPEND="
	>=app-maven/groovy-3.0.4:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.testng:testng:7.2.0 -> >=dev-java/testng-6.9.10:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=dev-java/testng-6.9.10:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="groovy,testng"
