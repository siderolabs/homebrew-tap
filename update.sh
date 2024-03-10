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

lines="$(grep -Po '(url "\K[^"]+)|(sha256 "\K[^"]+)' "${formula}")"
while IFS= read -r url && read -r hash; do
    new_url="${url/"#{version}"/"${new_ver}"}"
    echo "===> Downloading \"${new_url}\"..."
    wget -q -O "${tmp_file}" "${new_url}"

    echo "=====> Calculation SHA256 checksum..."
    new_hash=($(sha256sum ${tmp_file}))
    echo "=====> sha256: ${new_hash}"

    echo "=====> Updating hash in \"${formula}\"..."
    sed -i "s/${hash}/${new_hash}/" ${formula}

    rm ${tmp_file}
done <<< "${lines}"

current_ver="$(grep -Po 'version "\K(\d+\.\d+\.\d+)' "${formula}")"
echo "===> Updating version in formula \"${formula}\": ${current_ver} -> ${new_ver}"
sed -i "s/$(echo ${current_ver} | sed 's|\.|\\.|g')/${new_ver}/" ${formula}

echo "===> Done."
