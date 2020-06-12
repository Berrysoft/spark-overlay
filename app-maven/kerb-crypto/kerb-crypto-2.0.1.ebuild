# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kerb-crypto-2.0.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/kerby/kerb-crypto/2.0.1/kerb-crypto-2.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild kerb-crypto-2.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Kerby-kerb Crypto facility"
HOMEPAGE="https://directory.apache.org/kerby/kerby-kerb/kerb-crypto"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/kerby/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.kerby:kerb-crypto:2.0.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.kerby:kerb-core:2.0.1 -> >=app-maven/kerb-core-2.0.1:0
# org.apache.kerby:kerby-util:2.0.1 -> >=app-maven/kerby-util-2.0.1:0

CDEPEND="
	>=app-maven/kerb-core-2.0.1:0
	>=app-maven/kerby-util-2.0.1:0
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

JAVA_GENTOO_CLASSPATH="kerb-core,kerby-util"
