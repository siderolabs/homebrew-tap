# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.9.0"
  sha256 "c7298db732da518287f2209de79ff7f1e9e4d6f32f090450862400d2e2517b65"

  url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
    verified: "github.com/talos-systems/talos/"

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"

  binary "talosctl-darwin-amd64", target: "talosctl"
end
