# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-media-jaxb-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/jersey/media/jersey-media-jaxb/3.0.0-M1/jersey-media-jaxb-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-media-jaxb-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JAX-RS features based upon JAX-B."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/project/jersey-media-jaxb"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/jersey/media/${PN}/${PV}-M1/${P}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.media:jersey-media-jaxb:3.0.0-M1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M1.pom
# org.glassfish.hk2:osgi-resource-locator:1.0.3 -> >=app-maven/osgi-resource-locator-2.5.0_beta42:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=app-maven/jakarta-inject-2.6.1:0
# org.glassfish.jersey.core:jersey-common:3.0.0-M1 -> >=app-maven/jersey-common-3.0.0:0

CDEPEND="
	>=app-maven/jakarta-inject-2.6.1:0
	>=app-maven/jersey-common-3.0.0:0
	>=app-maven/osgi-resource-locator-2.5.0_beta42:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M1.pom
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC2 -> >=app-maven/jakarta-xml-bind-api-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="osgi-resource-locator,jakarta-inject,jersey-common"
JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-xml-bind-api"
