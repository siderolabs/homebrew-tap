# Copyright Sidero Labs, Inc.
# SPDX-License-Identifier: BUSL-1.1

class Omnictl < Formula
  desc "CLI for Omni - SaaS-simple deployment of Kubernetes - on your own hardware."
  homepage "https://omni.siderolabs.com/"
  version "0.48.0"
  license "BUSL-1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "8bae8a8d02eb6a573e8cd42489cb84d20181b818bf7fe89111b5f32271c71be7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-darwin-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "07c42b41fa32ffcf10ace71c1f81e91bb6d06797bf92fb095fb7e19bd6551f6c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-amd64",
      verified: "github.com/siderolabs/omni/"
    sha256 "1e45463143b23e576fa2eea957c1b0d15463e49a7e5953e790ec3c8fe739cdb2"
  elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/siderolabs/omni/releases/download/v#{version}/omnictl-linux-arm64",
      verified: "github.com/siderolabs/omni/"
    sha256 "3b5e64ac916e6d90b372c1b91c3af8ab358481eac5a8835e1477fc1fd3a307e2"
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
    system "#{bin}/omnictl --version"
  end
end
