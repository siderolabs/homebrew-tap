# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.10.0"
  sha256 "56aaea52fec5864cbfaf72befe3e10f9010478d1802bb870dfb8ea7dd0272a0c"

  url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
    verified: "github.com/talos-systems/talos/"

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"

  binary "talosctl-darwin-amd64", target: "talosctl"
end
