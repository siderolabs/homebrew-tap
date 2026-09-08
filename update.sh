#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "    usage:   ${0} <tool> <version>"
    echo "    example: ${0} talos 1.14.1"
    echo "    example: ${0} omni 1.11.3"
    exit 1
fi

# Use gsed if available (required on macOS)
if sed_cmd=$(command -v gsed); then
    echo "Using GNU sed: ${sed_cmd}"
elif sed_cmd=$(command -v sed); then
    echo "Using system sed: ${sed_cmd}"
else
    echo "ERROR: sed command not found"
    exit 3
fi

new_ver="${2}"
major_minor="$(echo "${new_ver}" | grep -oE '^[0-9]+\.[0-9]+')"
minor_no_dot="$(echo "${major_minor}" | tr -d '.')"

case "${1}" in
    talos) tool="talosctl" ;;
    omni)  tool="omnictl" ;;
    *)
        echo "ERROR: tool must be 'talos' or 'omni'"
        exit 1
        ;;
esac

update_formula() {
    local formula="${1}"
    local tmp_file="/tmp/${tool}.tmp"

    echo "==> Updating ${formula}"

    lines="$(${sed_cmd} -nE 's/.*(url|sha256) "([^"]+)".*/\2/p' "${formula}")"
    while IFS= read -r url && read -r hash; do
        new_url="${url/"#{version}"/${new_ver}}"
        echo "  Downloading ${new_url}..."
        wget -q -O "${tmp_file}" "${new_url}"

        new_hash=($(sha256sum "${tmp_file}"))
        echo "  sha256: ${new_hash}"

        ${sed_cmd} "s/${hash}/${new_hash}/" "${formula}" > "${formula}.tmp" && mv "${formula}.tmp" "${formula}"

        rm "${tmp_file}"
    done <<< "${lines}"

    current_ver="$(${sed_cmd} -nE 's/.*version "([0-9]+\.[0-9]+\.[0-9]+).*/\1/p' "${formula}")"
    echo "  Version: ${current_ver} -> ${new_ver}"
    ${sed_cmd} "s/$(echo "${current_ver}" | ${sed_cmd} 's|\.|\\.|g')/${new_ver}/" "${formula}" > "${formula}.tmp" && mv "${formula}.tmp" "${formula}"
}

create_versioned_formula() {
    local source="${1}"
    local dest="${2}"

    rolling_class="$(${sed_cmd} -nE 's/^class ([A-Za-z]+) < Formula/\1/p' "${source}")"
    versioned_class="${rolling_class}AT${minor_no_dot}"

    cp "${source}" "${dest}"

    # Update class name
    ${sed_cmd} "s/class ${rolling_class} < Formula/class ${versioned_class} < Formula/" "${dest}" > "${dest}.tmp" && mv "${dest}.tmp" "${dest}"

    # Add keg_only :versioned_formula after the license line
    ${sed_cmd} '/^  license /a\  keg_only :versioned_formula' "${dest}" > "${dest}.tmp" && mv "${dest}.tmp" "${dest}"

    echo "==> Created ${dest} (class: ${versioned_class})"
}

rolling_formula="./Formula/${tool}.rb"
versioned_formula="./Formula/${tool}@${major_minor}.rb"

rolling_ver="$(${sed_cmd} -nE 's/.*version "([0-9]+\.[0-9]+\.[0-9]+).*/\1/p' "${rolling_formula}")"
rolling_major_minor="$(echo "${rolling_ver}" | grep -oE '^[0-9]+\.[0-9]+')"

oldest="$(printf '%s\n' "${new_ver}" "${rolling_ver}" | sort -V | head -1)"
if [ "${oldest}" = "${rolling_ver}" ]; then
    update_formula "${rolling_formula}"
else
    echo "==> Skipping rolling formula (currently at ${rolling_ver}, newer than ${new_ver})"
fi

# Update or create versioned formula
if [ -f "${versioned_formula}" ]; then
    update_formula "${versioned_formula}"
else
    echo "==> No versioned formula found for ${major_minor}, creating ${versioned_formula}"
    create_versioned_formula "${rolling_formula}" "${versioned_formula}"
    update_formula "${versioned_formula}"
fi

echo "===> Done."
