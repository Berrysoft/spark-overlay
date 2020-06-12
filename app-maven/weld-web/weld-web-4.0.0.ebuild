# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/weld-web-4.0.0.Alpha2.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/weld/module/weld-web/4.0.0.Alpha2/weld-web-4.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild weld-web-4.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Weld Web module"
HOMEPAGE="http://weld.cdi-spec.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/weld/module/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.weld.module:weld-web:4.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# com.github.spotbugs:spotbugs-annotations:3.1.11 -> >=app-maven/spotbugs-annotations-4.0.3:0
# jakarta.el:jakarta.el-api:4.0.0-RC1 -> >=app-maven/jakarta-el-api-4.0.0:0
# jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0-M2 -> >=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
# jakarta.servlet:jakarta.servlet-api:5.0.0-M1 -> >=app-maven/jakarta-servlet-api-5.0.0:0
# org.jboss.logging:jboss-logging:3.4.1.Final -> >=dev-java/jboss-logging-3.1.4:0
# org.jboss.weld:weld-api:4.0.Alpha1 -> >=app-maven/weld-api-4.0:0
# org.jboss.weld:weld-core-impl:4.0.0.Alpha2 -> >=app-maven/weld-core-impl-4.0.0:0
# org.jboss.weld:weld-spi:4.0.Alpha1 -> >=app-maven/weld-spi-4.0:0

CDEPEND="
	>=app-maven/jakarta-el-api-4.0.0:0
	>=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
	>=app-maven/jakarta-servlet-api-5.0.0:0
	>=app-maven/spotbugs-annotations-4.0.3:0
	>=app-maven/weld-api-4.0:0
	>=app-maven/weld-core-impl-4.0.0:0
	>=app-maven/weld-spi-4.0:0
	>=dev-java/jboss-logging-3.1.4:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# org.jboss.logging:jboss-logging-processor:2.2.1.Final -> >=app-maven/jboss-logging-processor-2.2.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jboss-logging-processor-2.2.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="spotbugs-annotations,jakarta-el-api,jakarta-enterprise-cdi-api,jakarta-servlet-api,jboss-logging,weld-api,weld-core-impl,weld-spi"
JAVA_GENTOO_CLASSPATH_EXTRA="jboss-logging-processor"
