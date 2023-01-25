# typed: false
# frozen_string_literal: true

# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "1.3.3"

  on_intel do
    sha256 "2f16b5a6c1821ee9e562b83fc514b9c0af2d8ed6b25e873d4ed7ad25ff18aa0e"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
        verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  end
  on_arm do
    sha256 "f51d6039639f9792e84b36bdc2c53075e9ca1443cb6f504b84b9dc9a663e70f5"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
        verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev/"

  zap trash: "~/.talos"
end
