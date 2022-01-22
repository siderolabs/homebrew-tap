# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "0.14.1"

  if Hardware::CPU.intel?
    sha256 "25e21960eaaf668f33233a53d64d3b945da92ac862bf587d7d1d31239a5cb0df"
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/talos-systems/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "18caf291856fd4dcfc03611100f04176aa667d40229fe6f4d7079365eadd3575"
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/talos-systems/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"
end
