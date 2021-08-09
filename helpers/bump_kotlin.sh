#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 PVR"
    echo "Bump the version of Kotlin ebuilds to the specified PVR."
    echo "ebuilds are searched recursively under the current working directory."
    exit 1
fi

# The 'repoman' command
# Can be overridden to invoke with superuser privilege, e.g.:
#   REPOMAN="sudo repoman"
REPOMAN="${REPOMAN:-repoman}"

# PNs that should not be bumped by this script
PN_EXCLUDES=(
    kotlin-common-bin
    kotlin-coroutines-experimental-compat
    kotlin-protobuf-lite
)

PVR="$1"

for pkg_dir in $(find -type d -name "kotlin-*" -printf "%P\n"); do
    PN="$(basename "${pkg_dir}")"

    for excluded in "${PN_EXCLUDES[@]}"; do
        [[ "${PN}" == "${excluded}" ]] && continue 2
    done

    echo -n "Entering directory "
    pushd "${pkg_dir}"
    ebuilds_rev_sorted=( $(ls -rv "${PN}"-*.ebuild) )
    new_ebuild="${PN}-${PVR}.ebuild"
    cp -v "${ebuilds_rev_sorted[0]}" "${new_ebuild}"
    echo "${REPOMAN} manifest"
    ${REPOMAN} manifest
    popd > /dev/null
done