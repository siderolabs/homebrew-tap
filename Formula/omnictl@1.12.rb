# Copyright Sidero Labs, Inc.
# SPDX-License-Identifier: BUSL-1.1

class OmnictlAT112 < Formula
  desc "CLI for Omni - SaaS-simple deployment of Kubernetes - on your own hardware."
  homepage "https://omni.siderolabs.com/"
  version "1.12.2"
  license "BUSL-1.1"
  keg_only :versioned_formula

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "845f0f3e73a84fb0864db26de68a09cfc1b6a8269730696b7afcb8ffc7367429"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "8861080d6967341f3bf2a3bd88b90077009c1a75923ff1ad4bc9725f7a686c2c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "7e79fcfa6e8ad20b92bcfe3026d01edefcc65ce2fef927f54310a0ec0dfff0c4"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "333585c3d161d4f6a8280f1da26a1fb0e271252ebcc10c395b48d54192a373f4"
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
