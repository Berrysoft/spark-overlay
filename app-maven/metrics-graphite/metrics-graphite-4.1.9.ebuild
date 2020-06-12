# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/metrics-graphite-4.1.9.pom --download-uri https://repo.maven.apache.org/maven2/io/dropwizard/metrics/metrics-graphite/4.1.9/metrics-graphite-4.1.9-sources.jar --slot 0 --keywords "~amd64" --ebuild metrics-graphite-4.1.9.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A reporter for Metrics which announces measurements to a Graphite server."
HOMEPAGE="https://metrics.dropwizard.io/metrics-graphite"
SRC_URI="https://repo.maven.apache.org/maven2/io/dropwizard/metrics/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.dropwizard.metrics:metrics-graphite:4.1.9"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.rabbitmq:amqp-client:5.5.3 -> >=app-maven/amqp-client-5.9.0:0
# io.dropwizard.metrics:metrics-core:4.1.9 -> >=app-maven/metrics-core-4.1.9:0
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/amqp-client-5.9.0:0
	>=app-maven/metrics-core-4.1.9:0
	>=dev-java/slf4j-api-1.7.7:0
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

JAVA_GENTOO_CLASSPATH="amqp-client,metrics-core,slf4j-api"
