# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/htrace-core4-4.2.0-incubating.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/htrace/htrace-core4/4.2.0-incubating/htrace-core4-4.2.0-incubating-sources.jar --slot 0 --keywords "~amd64" --ebuild htrace-core4-4.2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A distributed tracing framework."
HOMEPAGE="http://incubator.apache.org/projects/htrace.html"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/htrace/${PN}/${PV}-incubating/${P}-incubating-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.htrace:htrace-core4:4.2.0-incubating"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

