# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/aopalliance-repackaged-2.6.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/hk2/external/aopalliance-repackaged/2.6.1/aopalliance-repackaged-2.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild aopalliance-repackaged-2.6.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Dependency Injection Kernel"
HOMEPAGE="https://github.com/eclipse-ee4j/glassfish-hk2/external/aopalliance-repackaged"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/hk2/external/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/hk2/external/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.hk2.external:aopalliance-repackaged:2.6.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# aopalliance:aopalliance:1.0 -> >=dev-java/aopalliance-1.0:1

CDEPEND="
	>=dev-java/aopalliance-1.0:1
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

JAVA_GENTOO_CLASSPATH="aopalliance-1"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}