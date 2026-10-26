# Copyright Contributors to the Talos project.
# SPDX-License-Identifier: MPL-2.0

class TalosctlAT114 < Formula
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"
  version "1.14.5"
  license "MPL-2.0"
  keg_only :versioned_formula

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "cf994f2f9b3b24941f331124bade278eb6bd84e9f2c2b1bb0cfb5f7cb49db13c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "c865077bdfc99c38d70b377708682eec1a8febab987f0623206e7139d9013096"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "ff432b68986709e6b69c563a08a2ced4232d5196b0dccd6d2e783e9d714d7d7d"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-armv7",
      verified: "github.com/siderolabs/talos/"
    sha256 "4927d08ddd2430c37bae9ba2c3124da2571b56bdbff454db2cda7649a056a8bf"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "dfd3aa33c3159810e216fc39afb685d4d120c8f2728e017d8c7f7635d3139382"
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

    chmod 0555, bin/"talosctl"

    generate_completions_from_executable(bin/"talosctl", shell_parameter_format: :cobra)
  end

  test do
    system "#{bin}/talosctl" "version"
  end
end
