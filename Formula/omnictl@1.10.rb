# Copyright Sidero Labs, Inc.
# SPDX-License-Identifier: BUSL-1.1

class OmnictlAT110 < Formula
  desc "CLI for Omni - SaaS-simple deployment of Kubernetes - on your own hardware."
  homepage "https://omni.siderolabs.com/"
  version "1.10.6"
  license "BUSL-1.1"

  keg_only :versioned_formula

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "7edc84ac13ae4c65ff842b37303b09b285b054b75c2ec9ceea950aae335040e9"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "743dafd3fec7697e576de472426fcf20ebe6d86ccdad42f68c729878e588d758"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "2f192d6f11d3209489df4fa768074ac81a4b7e97f90bd6eccda7c93ebd45ffb0"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "6fd269921e5b576963c297233f2009fe4462ef5cd77b67b0a16bc24dbf9dbc9d"
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
