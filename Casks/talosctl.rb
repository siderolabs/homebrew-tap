# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "1.0.6"

  if Hardware::CPU.intel?
    sha256 "9b75b1faa3cf762039f50ae7c7ae58dc3f573136417c19c42fb84bf8977c6330"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "7d66db83ddd335a46f392e97173f9d034d9dfd8e68749651cddad924c7d0bb90"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"
  
  zap trash: "~/.talos"
end
