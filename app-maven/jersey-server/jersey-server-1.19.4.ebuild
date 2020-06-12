# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-server-1.19.4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/jersey/jersey-server/1.19.4/jersey-server-1.19.4-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-server-1.19.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jersey is the open source (under dual CDDL+GPL license) JAX-RS (JSR 311)
        production quality Reference Implementation for building
        RESTful Web services."
HOMEPAGE="https://jersey.java.net/jersey-server/"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.jersey:jersey-server:1.19.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.sun.jersey:jersey-core:1.19.4 -> >=app-maven/jersey-core-1.19.4:0

CDEPEND="
	>=app-maven/jersey-core-1.19.4:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.annotation:jsr250-api:1.0 -> >=dev-java/jsr250-1.2:0
# javax.mail:mail:1.4 -> >=dev-java/oracle-javamail-1.5.6:0
# javax.xml.bind:jaxb-api:2.1 -> >=app-maven/jaxb-api-2.4.0.180830.0359:0
# org.osgi:osgi_R4_core:1.0 -> >=app-maven/osgi-core-bin-1.0:4

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jaxb-api-2.4.0.180830.0359:0
	>=app-maven/osgi-core-bin-1.0:4
	>=dev-java/jsr250-1.2:0
	>=dev-java/oracle-javamail-1.5.6:0
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jersey-core"
JAVA_GENTOO_CLASSPATH_EXTRA="jsr250,oracle-javamail,jaxb-api,osgi-core-bin-4"
