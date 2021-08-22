#!/usr/bin/env bash

# A leaf ebuild test case to cover all ebuilds in the Spark overlay
# Portage configuration: USE="binary"

PORTAGE_CONFIGS=( tests/portage-configs/binary )

. tests/resources/leaf-ebuilds/test-case-tmpl.sh
