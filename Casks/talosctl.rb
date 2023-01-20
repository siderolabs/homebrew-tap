# typed: false
# frozen_string_literal: true

# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "1.3.2"

  on_intel do
    sha256 "2ec5a4696197ede151cc72b3c34c1f1b24854f88bfb1c06f2c0aa3f3fccd1990"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
        verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  end
  on_arm do
    sha256 "8755bee1600ac7b906712d834acdee0bb30acf66b53c0cb0b38b0f5ccee57c81"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
        verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"

  zap trash: "~/.talos"
end
