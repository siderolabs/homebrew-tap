# Copyright Sidero Labs, Inc.
# SPDX-License-Identifier: BUSL-1.1

class OmnictlAT113 < Formula
  desc "CLI for Omni - SaaS-simple deployment of Kubernetes - on your own hardware."
  homepage "https://omni.siderolabs.com/"
  version "1.13.0"
  license "BUSL-1.1"
  keg_only :versioned_formula

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "7250d2b960694f16bc00d9ee251847f52cd6b9594e21fa6ead6018b4002de934"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "e5fd3a420668bf6426fbc5a3541fc5a80ec76792caeddec75a668ed6a9356bda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "1bd6d24f9f44561ba276cf5c301d700e0a18d7c0f9f7112c24afb1f0fa3e836d"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "cc15a4f918bdf5bb17d1dd80fa390c2502791731a4071af8aaacb4c726e889eb"
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
