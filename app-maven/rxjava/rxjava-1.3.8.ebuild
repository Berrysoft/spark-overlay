# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/rxjava-1.3.8.pom --download-uri https://repo.maven.apache.org/maven2/io/reactivex/rxjava/1.3.8/rxjava-1.3.8-sources.jar --slot 0 --keywords "~amd64" --ebuild rxjava-1.3.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="rxjava"
HOMEPAGE="https://github.com/ReactiveX/RxJava"
SRC_URI="https://repo.maven.apache.org/maven2/io/reactivex/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.reactivex:rxjava:1.3.8"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

