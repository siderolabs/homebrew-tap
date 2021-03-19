# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.8.5"
  sha256 "41c992c73e22ddbf97e39b1fe1a85014c6ae87577314673d7e73462b8bfca13e"

  url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
    verified: "github.com/talos-systems/talos/"

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"

  binary "talosctl-darwin-amd64", target: "talosctl"
end
