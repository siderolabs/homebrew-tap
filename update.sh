#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "    usage:   ${0} <tool> <version>"
    echo "    example: ${0} talosctl 1.4.7"
    exit 1
fi

new_ver="${2}"
tool="${1}"

formula="./Formula/${tool}.rb"
tmp_file="/tmp/${tool}.tmp"

lines="$(awk -F'"' '/url "|sha256 "/ {print $2}' "${formula}")"
while IFS= read -r url && read -r hash; do
    new_url="${url/"#{version}"/"${new_ver}"}"
    echo "===> Downloading \"${new_url}\"..."
    if command -v wget >/dev/null 2>&1; then
        wget -q -O "${tmp_file}" "${new_url}"
    else
        curl -sSL -o "${tmp_file}" "${new_url}"
    fi

    echo "=====> Calculation SHA256 checksum..."
    new_hash=$(shasum -a 256 "${tmp_file}" | awk '{print $1}')
    echo "=====> sha256: ${new_hash}"

    echo "=====> Updating hash in \"${formula}\"..."
    if [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' "s/${hash}/${new_hash}/" "${formula}"
    else
        sed -i "s/${hash}/${new_hash}/" "${formula}"
    fi

    rm ${tmp_file}
done <<< "${lines}"

# extract current version string from the formula
current_ver="$(awk -F'"' '/^  version/ {print $2}' "${formula}")"
echo "===> Updating version in formula \"${formula}\": ${current_ver} -> ${new_ver}"
if [[ "$(uname)" == "Darwin" ]]; then
    sed -i '' "s/$(echo ${current_ver} | sed 's|\.|\\.|g')/${new_ver}/" "${formula}"
else
    sed -i "s/$(echo ${current_ver} | sed 's|\.|\\.|g')/${new_ver}/" "${formula}"
fi

echo "===> Done."
