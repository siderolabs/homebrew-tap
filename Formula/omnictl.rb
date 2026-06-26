# Copyright Sidero Labs, Inc.
# SPDX-License-Identifier: BUSL-1.1

class Omnictl < Formula
  desc "CLI for Omni - SaaS-simple deployment of Kubernetes - on your own hardware."
  homepage "https://omni.siderolabs.com/"
  version "1.9.0"
  license "BUSL-1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "4b47df9999975c73b04556cd1c30311d4daa4da877dcf15521e337127adcde8d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "b07088d0b92d0c010bc2a5d0d48a880afe3a413783b456bdaf032b2816d194a0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "a1f13037f0fdcbf2438b48fb5983cf9e6962b106b0954a99c0dc87f47fd83a8a"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "2e3e666f7c297bf1c491b42b1ff20993ccc8a921f073bf05fdb5505fd0e9bbcb"
  else
    odie "Unexpected platform!"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "omnictl-darwin-amd64" => "omnictl"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "omnictl-darwin-arm64" => "omnictl"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "omnictl-linux-amd64" => "omnictl"
    elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      bin.install "omnictl-linux-arm64" => "omnictl"
    end

    chmod 0555, bin/"omnictl"

    generate_completions_from_executable(bin/"omnictl", shell_parameter_format: :cobra)
  end

  test do
    system "#{bin}/omnictl --version"
  end
end
