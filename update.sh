#!/usr/bin/env bash

set -euo pipefail

formula="./Formula/talosctl.rb"
tmp_file="/tmp/talosctl.tmp"
new_ver="${1}"

if [ "$#" -ne 1 ]; then
    echo "    usage:   ${0} <version>"
    echo "    example: ${0} 1.4.7"
    exit 1
fi

lines="$(grep -Po '(url "\K[^"]+)|(sha256 "\K[^"]+)' "${formula}")"
while IFS= read -r url && read -r hash; do
    new_url="${url/"#{version}"/"${new_ver}"}"
    echo "===> Downloading \"${new_url}\"..."
    wget -q -O "${tmp_file}" "${new_url}"

    echo "=====> Calculation SHA256 checksum..."
    new_hash=($(sha256sum /tmp/talosctl.tmp))
    echo "=====> sha256: ${new_hash}"

    echo "=====> Updating hash in \"${formula}\"..."
    sed -i "s/${hash}/${new_hash}/" ${formula}

    rm ${tmp_file}
done <<< "${lines}"

current_ver="$(grep -Po 'version "\K(\d+\.\d+\.\d+)' "${formula}")"
echo "===> Updating version in formula \"${formula}\": ${current_ver} -> ${new_ver}"
sed -i "s/$(echo ${current_ver} | sed 's|\.|\\.|g')/${new_ver}/" ${formula}

echo "===> Done."
