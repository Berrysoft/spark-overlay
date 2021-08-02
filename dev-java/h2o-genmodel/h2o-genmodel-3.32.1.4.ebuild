# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="ai.h2o:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="H2O GenModel"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI="
	https://github.com/h2oai/h2o-3/archive/refs/tags/jenkins-${PV}.tar.gz -> h2o-${PV}.tar.gz
	https://repo1.maven.org/maven2/ai/h2o/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/h2o-logger-${PV}:${SLOT}
	>=dev-java/h2o-tree-api-0.3.17:0
	>=dev-java/gson-2.8.6:2.7
	>=dev-java/opencsv-2.3:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/h2o-3-jenkins-${PV}/${PN}"

JAVA_RESOURCE_DIRS="src/main/resources"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_SRC_DIR="skip-junit-tests-due-to-unpackaged-test-deps"
