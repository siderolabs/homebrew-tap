# Copyright Contributors to the Talos project.
# SPDX-License-Identifier: MPL-2.0

class Talosctl < Formula
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"
  version "1.5.4"
  license "MPL-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "64d09fd54005243490b6fbd872fa04d5e0f03a1c4abe59c9ebf53ab6155fd29c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "0500674966a39a7f4b43800225b98dfae721ae7843d9212ee51342c0e2641069"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "98d28410f27028ee7e23335e1901da00accc071e262fcb343c892e18fa6ec9af"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-armv7",
      verified: "github.com/siderolabs/talos/"
    sha256 "0e505942e8cca30063df9e867a6c41dff87b092b6c484a3ad7e1e360f1eb29e7"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "02ffeea967b65a5337d9c9c1685b13d050f2d2cae8cbc683835ec123431467ac"
  else
    odie "Unexpected platform!"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "talosctl-darwin-amd64" => "talosctl"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "talosctl-darwin-arm64" => "talosctl"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "talosctl-linux-amd64" => "talosctl"
    elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      bin.install "talosctl-linux-armv7" => "talosctl"
    elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      bin.install "talosctl-linux-arm64" => "talosctl"
    end
  end

  test do
    system "#{bin}/talosctl" "version"
  end
end
