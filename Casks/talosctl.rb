# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.13.0"

  if Hardware::CPU.intel?
    sha256 "2719db0fa33c3337f9e2ad2aca289d208272b920b039cb731427ec16244c7159"
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/talos-systems/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "48949176e6b399c3bdfeab6d12aac0b3b13374e837fe62c7e7c08bf7933b7529"
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/talos-systems/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"
end
