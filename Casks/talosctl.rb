# typed: false
# frozen_string_literal: true

# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "1.2.0"

  if Hardware::CPU.intel?
    sha256 "5659949e0a09409ec421924f88f02194195c905a3ddbef2b1e68d2a00104b1e1"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
        verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "36ad8abb0abcb09e5c726818a6cd1c40e9e1b89aa601924db21f2333f4966eb2"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
        verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"

  zap trash: "~/.talos"
end
