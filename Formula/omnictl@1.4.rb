# Copyright Sidero Labs, Inc.
# SPDX-License-Identifier: BUSL-1.1

class OmnictlAT14 < Formula
  desc "CLI for Omni - SaaS-simple deployment of Kubernetes - on your own hardware."
  homepage "https://omni.siderolabs.com/"
  version "1.4.11"
  license "BUSL-1.1"

  conflicts_with "omnictl", because: "both install a binary named 'omnictl'"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "8590ea25af4090f1545961d5e1bc1c7dc1a9ddd824fa0a9e068d277295fa65b7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "f539308603650515820c106a4a1f443cb25fbb9d23f789ac5ca676045608a503"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "e57f6de2a9f71e6204471d2bfbc2f0ba4bc77f26877e33d7f017fadda319cb9b"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "c43a402e3076e85ed707a9d21207eae31cb8478a97f3d546609076a0a1330b9f"
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
  end

  def post_install
    generate_completions_from_executable(bin/"omnictl", "completion")
  end

  test do
    system "#{bin}/omnictl", "--version"
  end
end
