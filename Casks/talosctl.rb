# https://github.com/Homebrew/homebrew-cask/tree/master/doc/cask_language_reference

cask "talosctl" do
  version "1.1.0"

  if Hardware::CPU.intel?
    sha256 "dd3aecd47df7db430d1a812b6839274fda06600249e47aa437c2f9a5bd74475f"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-amd64",
      verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-amd64", target: "talosctl"
  else
    sha256 "0a1348d9dd4167e7ff79e08c84e7f2a6de474a90626fdbfdc33bf9497ed83879"
    url "https://github.com/siderolabs/talos/releases/download/v#{version}/talosctl-darwin-arm64",
      verified: "github.com/siderolabs/talos/"

    binary "talosctl-darwin-arm64", target: "talosctl"
  end

  name "talosctl"
  desc "A CLI for out-of-band management of Kubernetes nodes created by Talos"
  homepage "https://talos.dev"

  zap trash: "~/.talos"
end
