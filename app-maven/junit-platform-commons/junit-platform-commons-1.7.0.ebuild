# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/junit-platform-commons-1.7.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-commons/1.7.0-M1/junit-platform-commons-1.7.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild junit-platform-commons-1.7.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Module \"junit-platform-commons\" of JUnit 5."
HOMEPAGE="https://junit.org/junit5/"
SRC_URI="https://repo.maven.apache.org/maven2/org/junit/platform/${PN}/${PV}-M1/${P}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.junit.platform:junit-platform-commons:1.7.0-M1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M1.pom
# org.apiguardian:apiguardian-api:1.1.0 -> >=app-maven/apiguardian-api-1.1.0:0

CDEPEND="
	>=app-maven/apiguardian-api-1.1.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="apiguardian-api"
