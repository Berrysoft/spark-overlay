# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-all-5.0.0.Alpha2.pom --download-uri https://repo.maven.apache.org/maven2/io/netty/netty-all/5.0.0.Alpha2/netty-all-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-all-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Netty is an asynchronous event-driven network application framework for
    rapid development of maintainable high performance protocol servers and
    clients."
HOMEPAGE="http://netty.io/netty-all/"
SRC_URI="https://repo.maven.apache.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-all:5.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# com.google.protobuf:protobuf-java:2.5.0 -> >=app-maven/protobuf-java-3.12.2:0
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# io.netty:netty-buffer:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-codec:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-codec-dns:5.0.0.Alpha2 -> >=app-maven/netty-codec-dns-5.0.0:0
# io.netty:netty-codec-haproxy:5.0.0.Alpha2 -> >=app-maven/netty-codec-haproxy-5.0.0:0
# io.netty:netty-codec-http:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-codec-http2:5.0.0.Alpha2 -> >=app-maven/netty-codec-http2-5.0.0:0
# io.netty:netty-codec-memcache:5.0.0.Alpha2 -> >=app-maven/netty-codec-memcache-5.0.0:0
# io.netty:netty-codec-mqtt:5.0.0.Alpha2 -> >=app-maven/netty-codec-mqtt-5.0.0:0
# io.netty:netty-codec-socks:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-codec-stomp:5.0.0.Alpha2 -> >=app-maven/netty-codec-stomp-5.0.0:0
# io.netty:netty-common:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-example:5.0.0.Alpha2 -> >=app-maven/netty-example-5.0.0:0
# io.netty:netty-handler:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-handler-proxy:5.0.0.Alpha2 -> >=app-maven/netty-handler-proxy-5.0.0:0
# io.netty:netty-resolver:5.0.0.Alpha2 -> >=app-maven/netty-resolver-5.0.0:0
# io.netty:netty-resolver-dns:5.0.0.Alpha2 -> >=app-maven/netty-resolver-dns-5.0.0:0
# io.netty:netty-transport:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-transport-native-epoll:5.0.0.Alpha2 -> >=app-maven/netty-transport-native-epoll-5.0.0:0
# io.netty:netty-transport-rxtx:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-transport-sctp:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-transport-udt:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.jboss.marshalling:jboss-marshalling:1.3.18.GA -> >=app-maven/jboss-marshalling-2.0.9:0
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/jboss-marshalling-2.0.9:0
	>=app-maven/netty-codec-dns-5.0.0:0
	>=app-maven/netty-codec-haproxy-5.0.0:0
	>=app-maven/netty-codec-http2-5.0.0:0
	>=app-maven/netty-codec-memcache-5.0.0:0
	>=app-maven/netty-codec-mqtt-5.0.0:0
	>=app-maven/netty-codec-stomp-5.0.0:0
	>=app-maven/netty-example-5.0.0:0
	>=app-maven/netty-handler-proxy-5.0.0:0
	>=app-maven/netty-resolver-5.0.0:0
	>=app-maven/netty-resolver-dns-5.0.0:0
	>=app-maven/netty-transport-native-epoll-5.0.0:0
	>=app-maven/protobuf-java-3.12.2:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/netty-buffer-4.0.21:0
	>=dev-java/slf4j-api-1.7.7:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="protobuf-java,commons-logging,netty-buffer,netty-buffer,netty-codec-dns,netty-codec-haproxy,netty-buffer,netty-codec-http2,netty-codec-memcache,netty-codec-mqtt,netty-buffer,netty-codec-stomp,netty-buffer,netty-example,netty-buffer,netty-handler-proxy,netty-resolver,netty-resolver-dns,netty-buffer,netty-transport-native-epoll,netty-buffer,netty-buffer,netty-buffer,log4j,jboss-marshalling,slf4j-api"
