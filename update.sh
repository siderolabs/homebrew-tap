#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "    usage:   ${0} <tool> <version>"
    echo "    example: ${0} talosctl 1.4.7"
    exit 1
fi

# Use ggrep if available
if grep_cmd=$(command -v ggrep); then
    echo "Using GNU grep: ${grep_cmd}"
elif grep_cmd=$(command -v grep); then
    echo "Using system grep: ${grep_cmd}"
else
    echo "ERROR: grep command not found"
    exit 2
fi

# Use gsed if available
if sed_cmd=$(command -v gsed); then
    echo "Using GNU sed: ${sed_cmd}"
elif sed_cmd=$(command -v sed); then
    echo "Using system sed: ${sed_cmd}"
else
    echo "ERROR: sed command not found"
    exit 3
fi

new_ver="${2}"
tool="${1}"

formula="./Formula/${tool}.rb"
tmp_file="/tmp/${tool}.tmp"

lines="$(${grep_cmd} -Po '(url "\K[^"]+)|(sha256 "\K[^"]+)' "${formula}")"
while IFS= read -r url && read -r hash; do
    new_url="${url/"#{version}"/${new_ver}}"
    echo "===> Downloading \"${new_url}\"..."
    wget -q -O "${tmp_file}" "${new_url}"

    echo "=====> Calculation SHA256 checksum..."
    new_hash=($(sha256sum ${tmp_file}))
    echo "=====> sha256: ${new_hash}"

    echo "=====> Updating hash in \"${formula}\"..."
    ${sed_cmd} -i "s/${hash}/${new_hash}/" ${formula}

    rm ${tmp_file}
done <<< "${lines}"

current_ver="$(${grep_cmd} -Po 'version "\K(\d+\.\d+\.\d+)' "${formula}")"
echo "===> Updating version in formula \"${formula}\": ${current_ver} -> ${new_ver}"
${sed_cmd} -i "s/$(echo ${current_ver} | ${sed_cmd} 's|\.|\\.|g')/${new_ver}/" ${formula}

echo "===> Done."
