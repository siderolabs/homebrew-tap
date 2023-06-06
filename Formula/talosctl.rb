# Copyright Contributors to the Talos project.
# SPDX-License-Identifier: MPL-2.0

class Talosctl < Formula
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"
  version "1.4.5"
  license "MPL-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "09bd2c839e1d3b6f2c497612eeac703cf4a4baf812d8e4b1f821472a043bf435"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "a794227533ad94211e74a6b4746f661969c69448cec96fcd5cd6249276518b08"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "cdf9e6f753da911763ca70f377db1b47f1ce8d0448921179035364d7a05fb8eb"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-armv7",
      verified: "github.com/siderolabs/talos/"
    sha256 "92804afb7b9a14acba605d80e9a2f2ff7430cb10524279f0ff0a7ffac3be1003"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "bf93060dea48471043ffd401b871ee5dbf5145b7622296e60308d25eed3ecd14"
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
