# Copyright Contributors to the Talos project.
# SPDX-License-Identifier: MPL-2.0

class Talosctl < Formula
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"
  version "1.5.2"
  license "MPL-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "c0d5cfbc59f8b31b2de2f1ee7984f0694bef3912cab4ff77a331531e8718f78a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "da3b4e7c22b20f608b1f068a4d4dcfed278584016066f871d330506a05a2a29e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "bccdb7fffa72a67f57d6f94300eeb77b9fe840a47050f4aed9f73d6ab9f61b17"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-armv7",
      verified: "github.com/siderolabs/talos/"
    sha256 "921cfdbbd1084debab1d01938882e2c9b4fe66ffa38bf452f8c040e4d9030db4"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "0261c75b23d8c230b571448c7347c5182eeefbf3960ad893ba6ceb951f296ee3"
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
