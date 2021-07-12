# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.11.0"
  sha256 "940ea01179b5ab6cd4e63d28e32a9f7dd108fdea966b156ff37462d031dfa21b"

  url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
    verified: "github.com/talos-systems/talos/"

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"

  binary "talosctl-darwin-amd64", target: "talosctl"
end
