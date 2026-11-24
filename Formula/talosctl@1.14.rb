# Copyright Contributors to the Talos project.
# SPDX-License-Identifier: MPL-2.0

class TalosctlAT114 < Formula
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"
  version "1.14.7"
  license "MPL-2.0"
  keg_only :versioned_formula

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "a3e375d001ea04e9b4161eb9976ab14abd4e77957e9b6d33e894a41a7c6152eb"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "7eb6696ead7f6b1a2451fc50f022f4634cdaf7298af963e13c290c5583e185b9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-amd64",
      verified: "github.com/siderolabs/talos/"
    sha256 "823deb86e20d79f08d000b266e63e4bffc772ee80364ce405bad5659bcacfb18"
  elsif OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-armv7",
      verified: "github.com/siderolabs/talos/"
    sha256 "f2300f760adad444b89719bafa049a6dc591f583f89dbaef779a0d684b086cdd"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-linux-arm64",
      verified: "github.com/siderolabs/talos/"
    sha256 "b5537c9e59ab60c763bee9ab476bf936ecd400799ff670e1f1e8e19182f8233a"
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
