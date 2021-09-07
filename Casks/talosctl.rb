# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.12.1"
  sha256 "3e4f4a928f19f344d565a1a377ad681a16746ff4bef2dc52f6f4332f1b54f4a9"

  url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
    verified: "github.com/talos-systems/talos/"

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"

  binary "talosctl-darwin-amd64", target: "talosctl"
end
