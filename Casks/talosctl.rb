# typed: false
# frozen_string_literal: true

# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "1.4.0"

  on_intel do
    sha256 "c9585990b82047386d2d42f671da4f312c91f974961ecfdda9f396fa7cbdea7b"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
        verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  end
  on_arm do
    sha256 "44fe9fa944eae1cf425c0a59ba1d59e7d260059079e02426bb5d78f8304397e6"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
        verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"

  zap trash: "~/.talos"
end
