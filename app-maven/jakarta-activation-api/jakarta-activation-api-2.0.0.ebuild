# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.activation-api-2.0.0-RC3.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/activation/jakarta.activation-api/2.0.0-RC3/jakarta.activation-api-2.0.0-RC3-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-activation-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Activation API jar"
HOMEPAGE="https://github.com/eclipse-ee4j/jaf/jakarta.activation-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/activation/jakarta.activation-api/${PV}-RC3/jakarta.activation-api-${PV}-RC3-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.activation:jakarta.activation-api:2.0.0-RC3"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

