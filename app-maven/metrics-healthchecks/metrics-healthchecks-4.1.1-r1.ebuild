# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/metrics-healthchecks-4.1.1.pom --download-uri https://repo1.maven.org/maven2/io/dropwizard/metrics/metrics-healthchecks/4.1.1/metrics-healthchecks-4.1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild metrics-healthchecks-4.1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="An addition to Metrics which provides the ability to run application-specific health checks,
        allowing you to check your application's heath in production."
HOMEPAGE="http://metrics.dropwizard.io/metrics-healthchecks"
SRC_URI="https://repo1.maven.org/maven2/io/dropwizard/metrics/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/dropwizard/metrics/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.dropwizard.metrics:metrics-healthchecks:4.1.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# io.dropwizard.metrics:metrics-jvm:4.1.1 -> >=app-maven/metrics-jvm-4.1.1:0
# org.slf4j:slf4j-api:1.7.28 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=app-maven/metrics-jvm-4.1.1:0
	>=dev-java/slf4j-api-1.7.28:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="metrics-jvm,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}